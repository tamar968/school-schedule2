using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
   public class ScheduleRequest:IComparable
    {
        public string TeacherName { get; set; }
        public string SubjectName { get; set; }
        public string Color { get; set; }
        public int RowSpan { get; set; }
        public string EditUrl { get; set; }
        public int WeekDay { get; set; }
        public int Hour { get; set; }
        public int Cls { get; set; }
        public string Layer { get; set; }
        public string ClsNum { get; set; }
        public int CompareTo(object obj)
        {
            return Hour - (obj as ScheduleRequest).Hour;
        }

        public static ScheduleRequest CustDairyDTOToScheduleRequest(DairyDTO dairy)
        {
            return null;
        }
        public static ScheduleRequest CustScheduleToScheduleRequest(Schedule s)
        {
            return new ScheduleRequest
            {
                TeacherName = s.Group.Teacher1.Name,
                SubjectName = s.Group.Subject1.Name,
                Color = "ccffcc",
                RowSpan = 1,
                EditUrl = "login",
                Cls = s.Group.Classes.FirstOrDefault().Layer * 100 + s.Group.Classes.FirstOrDefault().Number,
                Hour = s.Hour,
                WeekDay = s.WeekDay
            };
        }
        public static List<ScheduleRequest> CustScheduleToScheduleRequest(List<Schedule> ScheduleList)
        {
            var sch = new List<ScheduleRequest>();
            foreach (var s in ScheduleList)
            {
                sch.Add(CustScheduleToScheduleRequest(s));
            }
            return sch;
        }

    }
}
