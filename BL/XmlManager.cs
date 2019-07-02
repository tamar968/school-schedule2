using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using DAL;
using DTO;
namespace BL
{
    public class XmlManager
    {
        private Dictionary<string, Action<string>> fileNameToAction;
        public XmlManager()
        {
            fileNameToAction = new Dictionary<string, Action<string>>();
            fileNameToAction["classes.xml"] = LoadClasses;
            fileNameToAction["groups.xml"] = LoadGroups;
            fileNameToAction["rooms.xml"] = LoadRooms;
            fileNameToAction["schedule.xml"] = LoadSchedule;
            fileNameToAction["subjects.xml"] = LoadSubjects;
            fileNameToAction["teachers.xml"] = LoadTeachers;
        }

        public void LoadDirectory(string path)
        {
            ClearDB();
            var directoryInfo = new DirectoryInfo(path);
            var files = directoryInfo.GetFiles();
            foreach (var file in files)
            {
                Action<string> action;
                if (fileNameToAction.TryGetValue(file.Name, out action))
                {
                    action?.Invoke(file.FullName);
                }
            }
        }
        public void ClearDB()
        {
           
            var conn = new SqlConnection("data source=SQL-SERVER; initial catalog=!ESTY&TAMAR; integrated security=True");
            SqlCommand cmd;
            conn.Open();

           
            cmd = new SqlCommand("sp_MSforeachtable 'DELETE FROM ?'", conn);
            cmd.ExecuteNonQuery();

            
            conn.Close();
        }
        public void LoadClasses(string path)
        {
            XmlClasses.root root = GetXmlData<XmlClasses.root>(path);
            try
            {
                using (Entities db = new Entities())
                {
                    foreach (XmlClasses.rootData rootData in root.data)
                    {
                        db.Classes.Add(_CastDTO.DTOToClass(new ClassDTO()
                        {
                            Layer = rootData.layer,
                            Name = rootData.name,
                            Num = rootData.num,
                            Number = rootData.class_number,
                            SchoolType = rootData.schooltype
                        }));

                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
            }
        }

        public void LoadGroups(string path)
        {
            XmlGroups.root root = GetXmlData<XmlGroups.root>(path);
            try
            {
                using (Entities db = new Entities())
                {
                    foreach (XmlGroups.rootGroup rootData in root.group)
                    {
                        db.Groups.Add(_CastDTO.DTOToGroup(new GroupDTO()
                        {
                            Num = rootData.num,
                            Teacher = rootData.tea,
                            Subject = rootData.subj,
                            Room = rootData.sroom,
                            Hours = rootData.no_of_hours,
                            CalculateHours = rootData.calculate_hours,
                            SchoolType = rootData.schooltype,
                            Reforma = rootData.reforma,
                            PayAbsence = rootData.goremMeshalem,
                            HourType = rootData.sug,
                            SubHourType = rootData.sub_sug
                        }));
                    }
                    db.SaveChanges();

                }
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
            }
        }

        public void LoadRooms(string path)
        {
            XmlRooms.root root = GetXmlData<XmlRooms.root>(path);

            try
            {
                using (Entities db = new Entities())
                {
                    foreach (XmlRooms.rootData rootData in root.data)
                    {
                        var roomDataNum = rootData.num.ToString();
                        db.Rooms.Add(_CastDTO.DTOToRoom(new RoomDTO()
                        {
                            ClassId = db.Classes.Where(c => c.Name == rootData.name).FirstOrDefault()?.Id,
                            Floor = int.Parse(roomDataNum[2].ToString()),
                            Number = int.Parse(roomDataNum[2].ToString()) * 100 + int.Parse(roomDataNum[3].ToString()),
                            UseFor = rootData.name
                        }));
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
            }
        }
        public void LoadSchedule(string path)
        {
            XmlSchedule.root root = GetXmlData<XmlSchedule.root>(path);

            try
            {
                using (Entities db = new Entities())
                {
                    foreach (XmlSchedule.rootGroup rootData in root.group)
                    {
                        //TODO
                        foreach (XmlSchedule.rootGroupSchedule rootGroupSchedule in rootData.schedule)
                        {
                            db.Schedules.Add(_CastDTO.DTOToSchedule(new ScheduleDTO()
                            {
                                Day = rootGroupSchedule.day,
                                Hour = rootGroupSchedule.hour,
                                WeekDay = rootGroupSchedule.weekDay,
                                Room = rootGroupSchedule.weekDay
                            }));
                        }
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
            }

        }
        public void LoadSubjects(string path)
        {
            XmlSubjects.root root = GetXmlData<XmlSubjects.root>(path);

            try
            {
                using (Entities db = new Entities())
                {
                    foreach (XmlSubjects.rootData rootData in root.data)
                    {
                        db.Subjects.Add(_CastDTO.DTOToSubject(new SubjectDTO()
                        {
                            Id = rootData.num,
                            Name = rootData.name
                        }));
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
            }
        }
        public void LoadTeachers(string path)
        {
            XmlTeachers.root root = GetXmlData<XmlTeachers.root>(path);

            try
            {
                using (Entities db = new Entities())
                {
                    foreach (XmlTeachers.rootData rootData in root.data)
                    {
                        db.Teachers.Add(_CastDTO.DTOToTeacher(new TeacherDTO()
                        {
                            Num = rootData.num,
                            Name = rootData.name,
                        }));
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                LogManager.LogException(e);

            }

        }
        /// <summary>
        /// read xml file
        /// and convert the text to object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="path"></param>
        /// <returns>root xml object</returns>
        private static T GetXmlData<T>(string path)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            StringReader stringReader = new StringReader(File.ReadAllText(path, Encoding.GetEncoding(1255)));
            T root = (T)serializer.Deserialize(stringReader);
            return root;
        }
        
    }
}
