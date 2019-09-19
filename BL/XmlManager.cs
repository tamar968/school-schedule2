
using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Serialization;

namespace BL
{
    public class XmlManager
    {
        private readonly Dictionary<string, Action<string>> fileNameToAction;
        public XmlManager()
        {
            fileNameToAction = new Dictionary<string, Action<string>>
            {
                ["teachers.xml"] = LoadTeachers,
                ["classes.xml"] = LoadClasses,
                ["subjects.xml"] = LoadSubjects,
                ["rooms.xml"] = LoadRooms,
                ["groups.xml"] = LoadGroups,
                ["schedule.xml"] = LoadSchedule
            };
        }

        public void LoadDirectory(string path)
        {
            ResetDB();
            var directoryInfo = new DirectoryInfo(path);
            var files = directoryInfo.GetFiles();
            foreach (var fileActionPair in fileNameToAction)
            {
                var file = files.Single(f => f.Name == fileActionPair.Key);
                Console.WriteLine("Loading {0}....", file.FullName);
                fileActionPair.Value?.Invoke(file.FullName);
            }
        }
        public void ResetDB()
        {

            int secWait = 5;
            Console.WriteLine("delete db {0} second along", secWait);
            System.Threading.Thread.Sleep(secWait * 1000);
            //Console.WriteLine("create connection...");
            // var conn = new SqlConnection("data source=SQLSRV; initial catalog=!ESTY&TAMAR; integrated security=True");
            //var conn = new SqlConnection("data source=DESKTOP-7A0S24C; initial catalog=!ESTY&TAMAR; integrated security=True");
            //Console.WriteLine("connect success!");
            //conn.Open();
            Console.WriteLine("delete....");
            using (Entities db = new Entities())
            {
                try
                {
                    //db.FILL_CONST_TABLES();
                }
                catch (Exception e)
                {
                    LogManager.LogException(e);
                }
                try
                {
                    db.TRUNCATE_MONTHLY_TABLES();
                }
                catch (Exception e)
                {
                    LogManager.LogException(e);
                }

            }
            //SqlCommand cmd;
            //cmd = new SqlCommand("sp_MSforeachtable 'DELETE FROM ?'", conn);
            //cmd.ExecuteNonQuery();
            Console.WriteLine("delete successfuly");

            //conn.Close();
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
                        var c = _CastDTO.DTOToClass(new ClassDTO()
                        {
                            Layer = rootData.layer,
                            Name = rootData.name,
                            Num = rootData.num,
                            Number = rootData.class_number,
                            SchoolType = rootData.schooltype
                        });
                        db.Classes.Add(c);
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
                        var t = _CastDTO.DTOToGroup(new GroupDTO()
                        {
                            Num = rootData.num,
                            Teacher = rootData.tea == -1 ? null : (int?)rootData.tea,
                            Subject = rootData.subj == -1 ? null : (int?)rootData.subj,
                            Room = rootData.sroom == -1 || rootData.sroom > 200 ? null : (int?)rootData.sroom,
                            Hours = rootData.no_of_hours,
                            CalculateHours = rootData.calculate_hours,
                            SchoolType = rootData.schooltype == 0 ? null : (int?)rootData.schooltype,
                            Reforma = rootData.reforma,
                            PayAbsence = rootData.goremMeshalem == 0 ? null : (int?)rootData.goremMeshalem,
                            HourType = null, //TODO rootData.sug == 0 ? null : (int?)rootData.sug,
                            SubHourType = null, // rootData.sub_sug == 0 ? null : (int?)rootData.sub_sug,
                        });
                        db.Groups.Add(t);
                        t.Classes = rootData.classes.Select(c => db.Classes.FirstOrDefault(cl => cl.Num == c.num)).ToList();
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
                        var r = _CastDTO.DTOToRoom(new RoomDTO()
                        {
                            ClassId = db.Classes.Where(c => c.Name == rootData.name).FirstOrDefault()?.Num,
                            Floor = int.Parse(roomDataNum[2].ToString()),
                            Number = int.Parse(roomDataNum[2].ToString()) * 100 + int.Parse(roomDataNum[3].ToString()),
                            UseFor = rootData.name
                        });
                        db.Rooms.Add(r);
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
                        if (rootData.schedule != null)
                            foreach (XmlSchedule.rootGroupSchedule rootGroupSchedule in rootData.schedule)
                            {
                                var s = _CastDTO.DTOToSchedule(new ScheduleDTO()
                                {
                                    Day = rootGroupSchedule.day,
                                    Hour = rootGroupSchedule.hour,
                                    WeekDay = rootGroupSchedule.weekDay,
                                    Room = rootGroupSchedule.weekDay,
                                    GroupId = rootData.num,
                                });
                                db.Schedules.Add(s);
                            }
                        db.SaveChanges();
                    }
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
                        var t = _CastDTO.DTOToTeacher(new TeacherDTO()
                        {
                            Num = rootData.num,
                            Name = rootData.name,
                        });
                        db.Teachers.Add(t);
                        //t.PayAbsences = rootData.details.goremMeshalem;
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

