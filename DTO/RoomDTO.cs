using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class RoomDTO
    {
        public int Id { get; set; }
        public int Floor { get; set; }
        public int Number { get; set; }
        public int? ClassId { get; set; }
        public string UseFor { get; set; }
        public ICollection<int> Dairies { get; set; }
        public ICollection<int> Schedules { get; set; }
        public ICollection<int> Groups { get; set; }
        public ICollection<int> Occasions { get; set; }
    }
}
