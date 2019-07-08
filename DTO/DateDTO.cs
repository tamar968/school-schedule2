using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DateDTO
    {
         public int Month { get; set; }
        public int Minute { get; set; }
        public int Millisecond { get; set; }
        public int Hour { get; set; }
        public int Day { get; set; }
        public int Second { get; set; }
        public int Year { get; set; }
        public DateTime thisDate { get; internal set; }
    }
}