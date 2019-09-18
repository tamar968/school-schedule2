using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ClassDTO
    {
        public int Num { get; set; }
        public string Name { get; set; }
        public int Layer { get; set; }
        public int Number { get; set; }
        public int? SchoolType { get; set; }
        public ICollection<int> Dairies { get; set; }
        public ICollection<int> Rooms { get; set; }
        public ICollection<int> Dairies1 { get; set; }
        public ICollection<int> Subjects { get; set; }
        public ICollection<int> Groups { get; set; }
        public ICollection<int> Occasions { get; set; }
    }
}
