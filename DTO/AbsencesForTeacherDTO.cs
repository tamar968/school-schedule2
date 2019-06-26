using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class AbsencesForTeacherDTO
    {
        public int Id { get; set; }
        public int TeacherId { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public int? TeacherStandIn { get; set; }
    }
}
