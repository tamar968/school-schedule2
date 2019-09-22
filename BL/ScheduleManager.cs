using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class ScheduleManager
    {

        public List<List<DairyDTO>> OrderByClass(List<DairyDTO> schedules)
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
        public List<List<ScheduleRequest>> OrderByDaysTeachers(List<ScheduleRequest> groups)
        {
            //List<ScheduleRequest> sch = _CastDTO.DTOToSchedule(groups);
            List<List<ScheduleRequest>> orderSchedule = new List<List<ScheduleRequest>>();
            int numOfDays = 6;//TODO change to the web config
            for (int day = 1; day <= numOfDays; day++)
            {
                var s = MergeLessonsByClasses(groups.Where(lsn => lsn.WeekDay == day).ToList());
                if (s != null && s.Count > 0)
                    s.Sort();
                orderSchedule.Add(s);
            }
            return orderSchedule;
        }
        public List<List<ScheduleRequest>> OrderByDaysClasses(List<ScheduleRequest> groups)
        {
            //List<ScheduleRequest> sch = _CastDTO.DTOToSchedule(groups);
            List<List<ScheduleRequest>> orderSchedule = new List<List<ScheduleRequest>>();
            int numOfDays = 6;//TODO change to the web config
            for (int day = 1; day <= numOfDays; day++)
            {
                var s = MergeLessonsByTeacher(groups.Where(lsn => lsn.WeekDay == day).ToList());
                if (s != null && s.Count > 0)
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
   className:''

*/
        public List<ScheduleRequest> MergeLessonsByTeacher(List<ScheduleRequest> schedule)
        {
            List<ScheduleRequest> n = new List<ScheduleRequest>();
            for (int i = 0; i < schedule.Count; i++)
            {
                if (!n.Any())
                {
                    n = new List<ScheduleRequest>
                    {
                        schedule[i]
                    };
                    continue;
                }
                else
                {
                    var t = n?.FirstOrDefault(l => schedule[i].Cls == l.Cls &&
                  schedule[i].SubjectName == l.SubjectName &&
                  schedule[i].Hour == l.Hour);
                    if (t != null)// &&! t.TeacherName.Contains(schedule[i].TeacherName))
                    {
                        if(!t.TeacherName.Contains(schedule[i].TeacherName))
                        t.TeacherName += " , " + schedule[i].TeacherName;
                    }
                    else
                        n.Add(schedule[i]);
                }
            }
            return n;
        }
        public List<ScheduleRequest> MergeLessonsByClasses(List<ScheduleRequest> schedule)
        {
            List<ScheduleRequest> newList = new List<ScheduleRequest>();
            for (int i = 0; i < schedule.Count; i++)
            {
                var current = schedule[i];
                //current.Layer = GetStringLayerFromCls(current.Cls);
                //current.ClsNum = GetClsNumFromCls(current.Cls);

                if (newList == null)
                {
                    newList = new List<ScheduleRequest>
                    {
                        current
                    };
                    continue;
                }
                else
                {
                    var t = newList?.FirstOrDefault(l => current.Cls == l.Cls &&
                  current.SubjectName == l.SubjectName &&
                  current.Hour == l.Hour);
                    if (t != null)
                    {
                        t.ClsNum += " , " + current.ClsNum;
                    }
                    else
                        newList.Add(current);
                }
            }
            return newList;
        }

        private string GetClsNumFromCls(int cls)
        {
            var clsNum = cls % 100;
            return ScheduleRequest.pairs[clsNum];
        }

        private string GetStringLayerFromCls(int cls)
        {
            var layer = cls / 100;
            return ScheduleRequest.pairs[layer];
        }

        //public List<List<ScheduleRequest>> GetScheduleByClass(int layer, int number)
        //{
        //    Console.WriteLine("in GetScheduleByClass");
        //    using (Entities db = new Entities())
        //    {
        //        var cls = db.Classes.Single(c => c.Layer == layer && c.Number == number);
        //        var newList = db.Schedules
        //             .Where(s => s.Group.Classes.Contains(cls))
        //             .Select(ScheduleRequest.CastScheduleToScheduleRequest)
        //             .ToList();
        //        return OrderByDaysClasses(newList);

        //    }
        //}
        public List<List<ScheduleRequest>> GetScheduleByClass(int layer, int number)
        {
            Console.WriteLine("in GetScheduleByClass");
            using (Entities db = new Entities())
            {
                return OrderByDaysClasses(db.Schedules.Select(ScheduleRequest.CastScheduleToScheduleRequest
                     //s => new ScheduleRequest
                     //{
                     //    TeacherName = s.Group.Teacher1.Name,
                     //    SubjectName = s.Group.Subject1.Name,
                     //    Color = "ccffcc",
                     //    RowSpan = 1,
                     //    EditUrl = "login",
                     //    //Cls = s.Group.Classes.FirstOrDefault().Layer * 100 + s.Group.Classes.FirstOrDefault().Number,
                     //    Hour = s.Hour,
                     //    WeekDay = s.WeekDay}
                     ).Where(l => l.Cls == layer * 100 + number).ToList());

            }
        }
        //public List<List<ScheduleRequest>> GetScheduleByClass(int clsId)
        //{
        //    Console.WriteLine("in GetScheduleByClass");
        //    using (Entities db = new Entities())
        //    {
        //        var cls = db.Classes.Single(c => c.Num == clsId);
        //        return OrderByDaysClasses(db.Schedules
        //             .Where(s => s.Group.Classes.Contains(cls))
        //             .Select(ScheduleRequest.CastScheduleToScheduleRequest)
        //             .ToList());

        //    }
        //}
        public List<List<ScheduleRequest>> GetScheduleByClass(int clsId)
        {
            Console.WriteLine("in GetScheduleByClass");
            using (Entities db = new Entities())
            {
                var cls = db.Classes.Single(c => c.Num == clsId);
                List<ScheduleRequest> newList = new List<ScheduleRequest>();
                //  db.Schedules.Where(l => l.Group.Teacher == teacherId).ToList().ForEach(s => newList.AddRange(ScheduleRequest.CastScheduleToScheduleRequestList(s)));

                db.Schedules.Where(l => l.Group.Classes.Any(c=> c.Num ==clsId)).ToList()?
                    .ForEach(s => newList.AddRange(ScheduleRequest.CastScheduleToScheduleRequestList(s)));
                return OrderByDaysClasses(newList.Where(s=> s.Cls == clsId).ToList());
            }
        }

        public List<List<ScheduleRequest>> GetScheduleByTeacher(int teacherId)
        {
            Console.WriteLine("in GetScheduleByTeacher");
            using (Entities db = new Entities())
            {
                var newList = new List<ScheduleRequest>();
                db.Schedules.Where(l => l.Group.Teacher == teacherId).ToList().ForEach(s => newList.AddRange(ScheduleRequest.CastScheduleToScheduleRequestList(s)));
                return OrderByDaysTeachers(newList);

            }
        }
        public List<List<DairyDTO>> GetScheduleByDate(DateTime date, int layer)
        {
            using (Entities db = new Entities())
            {
                return OrderByClass(_CastDTO.DairyToDTO(db.Dairies.Where(lsn => date <= lsn.FromDate && date >= lsn.ToDate && lsn.Classes.Any(c => c.Layer == layer)).ToList()));
            }
        }

        public List<List<ScheduleRequest>> GetScheduleByLayer(int l)
        {
            return null;//GetScheduleByDate(DateTime.Today, 9);
        }
    }
}
