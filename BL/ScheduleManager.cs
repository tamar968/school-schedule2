using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class ScheduleManager
    {
        public static List<List<DairyDTO>> GetScheduleByDate(DateTime date, int layer)
        {
            using (Entities db = new Entities())
            {
                return OrderByClass(_CastDTO.DairyToDTO(db.Dairies.Where(lsn => date <= lsn.FromDate && date >= lsn.ToDate && lsn.Classes.Any(c => c.Layer == layer)).ToList()));
            }
        }

        public static List<List<DairyDTO>> OrderByClass(List<DairyDTO> schedules)
        {
            List<Dairy> sch = _CastDTO.DTOToDairy(schedules);
            List<List<DairyDTO>> orderSchedule = new List<List<DairyDTO>>();
            int numOfClasses = 10;//TODO change to the web config
            for (int cls = 0; cls < numOfClasses; cls++)
            {
                var tmp = _CastDTO.DairyToDTO(sch.Where(s => s.Group.Classes.Any(c => c.Number == cls)).ToList());
                tmp.Sort();
                orderSchedule.Add(tmp);
            }
            return orderSchedule;
        }

        public static List<List<ScheduleRequest>> OrderByDays(List<ScheduleRequest> groups)
        {
            //List<ScheduleRequest> sch = _CastDTO.DTOToSchedule(groups);
            List<List<ScheduleRequest>> orderSchedule = new List<List<ScheduleRequest>>();
            int numOfDays = 6;//TODO change to the web config
            for (int day = 1; day <= numOfDays; day++)
            {
                var s = MergeLessonsByTeacher(groups.Where(lsn => lsn.WeekDay == day).ToList());
                s.Sort();
                orderSchedule.Add(s);
            }
            return orderSchedule;
        }
        /*
         SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 2,
            EditUrl: 'login'
            Day:''
            Hour:''
            class:''

         */
        public static List<ScheduleRequest> MergeLessonsByTeacher(List<ScheduleRequest> schedule)
        {
            List<ScheduleRequest> n = null;
            for (int i = 0; i < schedule.Count; i++)
            {
                if (n == null)
                {
                    n = new List<ScheduleRequest>();
                    n.Add(schedule[i]);
                    continue;
                }
                else
                {
                    var t = n?.FirstOrDefault(l => schedule[i].Cls == l.Cls &&
                  schedule[i].SubjectName == l.SubjectName &&
                  schedule[i].Hour == l.Hour);
                    if (t != null)
                    {
                        t.TeacherName += " , " + schedule[i].TeacherName;
                    }
                    else
                        n.Add(schedule[i]);
                }
            }
            return n;
        }

        public static List<List<ScheduleRequest>> GetScheduleByClass(int layer, int number)
        {
            Console.WriteLine("in GetScheduleByClass");
            using (Entities db = new Entities())
            {
                return OrderByDays(db.Schedules.Select(
                     s => new ScheduleRequest
                     {
                         TeacherName = s.Group.Teacher1.Name,
                         SubjectName = s.Group.Subject1.Name,
                         Color = "ccffcc",
                         RowSpan = 1,
                         EditUrl = "",
                         Cls = s.Group.Classes.FirstOrDefault().Layer * 100 + s.Group.Classes.FirstOrDefault().Number,
                         Hour = s.Hour,
                         WeekDay = s.WeekDay
                     }).Where(l => l.Cls == layer * 100 + number).ToList());

            }
        }

        public static List<List<ScheduleRequest>> GetScheduleByTeacher(int teacherId)
        {
            Console.WriteLine("in GetScheduleByTeacher");
            using (Entities db = new Entities())
            {
                return OrderByDays(db.Schedules.Select(s => new ScheduleRequest { TeacherName = s.Group.Teacher1.Name, SubjectName = s.Group.Subject1.Name, Color = "ccffcc", RowSpan = 1, EditUrl = "login", Cls = s.Group.Classes.FirstOrDefault().Layer * 100 + s.Group.Classes.FirstOrDefault().Number, Hour = s.Hour, WeekDay = s.WeekDay }).Where(l => l.TeacherName == l.TeacherName).ToList());
            }
        }
        public static List<List<ScheduleRequest>> GetScheduleByLayer(int layer)
        {
            return null;
        }
    }
}