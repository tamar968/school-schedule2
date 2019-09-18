using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DairyDTO:IComparable
    {
        public int Id { get; set; }
        public int? Num { get; set; }
        public int? TeacherId { get; set; }
        public int? SubjectId { get; set; }
        public int? TypeId { get; set; }
        public int? GroupId { get; set; }
        public int? RoomId { get; set; }
        public bool IsGrouped { get; set; }
        public int? OccasionId { get; set; }
        public int? Reforma { get; set; }
        public DateDTO FromDate { get; set; }
        public DateDTO ToDate { get; set; }
        public int Hour { get; set; }
        public decimal? CalculateHours { get; set; }
        public int? Cause { get; set; }
        public ICollection <int> Classes { get; set; }

        public int CompareTo(object obj)
        {
            return Hour - (obj as DairyDTO).Hour;
        }
    }
}
