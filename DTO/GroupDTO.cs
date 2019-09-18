using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class GroupDTO
    {
        public int Id { get; set; }
        public int Num { get; set; }
        public int? Teacher { get; set; }
        public int? Subject { get; set; }
        public int? Room { get; set; }
        public int? Hours { get; set; }
        public decimal? CalculateHours { get; set; }
        public int? SchoolType { get; set; }
        public int? Reforma { get; set; }
        public int? PayAbsence { get; set; }
        public int? HourType { get; set; }
        public int? SubHourType { get; set; }
        public ICollection<int> Classes { get; set; }
        public ICollection<int> Dairies { get; set; }
    }
}
