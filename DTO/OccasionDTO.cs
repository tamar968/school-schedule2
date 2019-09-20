using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class OccasionDTO
    {
        public int Id { get; set; }
        public DateDTO FromDate { get; set; }
        public DateDTO ToDate { get; set; }
        public int? FromLesson { get; set; }
        public int? ToLesson { get; set; }

        public int? OccasionType { get; set; }
        public int? Subject { get; set; }

        public ICollection<int> Dairies { get; set; }
        public ICollection<int> Classes { get; set; }
        public ICollection<int> Rooms { get; set; }
        public ICollection<int> Teachers { get; set; }
    }
}
