using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SubjectDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<int> Dairies { get; set; }
        public ICollection<int> Classes { get; set; }
        public ICollection<int> Groups { get; set; }
    }
}
