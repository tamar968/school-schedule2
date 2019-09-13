using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ScheduleDTO
    {
        public int Num { get; set; }
        public int GroupId { get; set; }
        public int WeekDay { get; set; }
        public int Day { get; set; }
        public int Hour { get; set; }
        public decimal? CalculateHours { get; set; }
        public int? Cause { get; set; }
        public int? Room { get; set; }
    }
}
