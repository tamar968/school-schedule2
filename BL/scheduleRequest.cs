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

        public int CompareTo(object obj)
        {
            return Hour - (obj as ScheduleRequest).Hour;
        }
    }
}
