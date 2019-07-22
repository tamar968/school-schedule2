using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TeacherDTO
    {
        public int Id { get; set; }
        public int Num { get; set; }
        public string Name { get; set; }
        public virtual ICollection<int> Dairies { get; set; }
        public virtual ICollection<int> PayAbsences { get; set; }
        public virtual ICollection<int> Groups { get; set; }
        public virtual ICollection<int> AbsencesForTeachers { get; set; }
        public virtual ICollection<int> Occasions { get; set; }
    }
}
