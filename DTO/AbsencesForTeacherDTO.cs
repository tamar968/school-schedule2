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
        public DateDTO FromDate { get; set; }
        public DateDTO ToDate { get; set; }
        public int? TeacherStandIn { get; set; }
        public int Type { get; set; }

    }
}
