using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class StudyTimeDTO
    {
        public int Num { get; set; }
        public int WeekDay { get; set; }
        public int Day { get; set; }
        public int Hour { get; set; }
        public int? Room { get; set; }
    }
}
