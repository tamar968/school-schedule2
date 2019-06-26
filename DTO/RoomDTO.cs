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
    }
}
