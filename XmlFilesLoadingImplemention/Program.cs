using BL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestCode
{
    class Program
    {
        static void Main(string[] args)
        {
           var xmlManager = new XmlManager();

            //xmlManager.LoadSchedule("../../XML_files/schedule.xml");
            xmlManager.LoadDirectory("../../XML_files");
            //var l = Teacher.Get();
            //foreach (var item in l)
            //{
            //    Console.WriteLine(item);
            //}
            //LogManager.LogException(new Exception("be carefull"));
            //BL.AbsenceForTeacher.Add(new AbsencesForTeacherDTO()
            //{
            //    FromDate = _CastDTO.DateToDTO(DateTime.Now),
            //    ToDate = _CastDTO.DateToDTO(DateTime.Now),
            //    TeacherId = 179,
            //    Type = 4,
            //    TeacherStandIn = 180
            //});
            //var z = BL.Class.ClassByLayer.Keys;
            //var x = BL.Class.ClassByLayer;
          var s = new ScheduleManager();

           var l = s.GetScheduleByClass(9, 2);
            Console.WriteLine(l.Count());
            //Console.ReadLine();
        }
    }
}
