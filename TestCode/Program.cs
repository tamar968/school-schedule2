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
            /*var xmlManager = new XmlManager();

            xmlManager.LoadDirectory(@"Y:\group 2 תשעט\הכהן עדני תמר\קבצים לפרויקט\תלמש\Talmash\חשון עט\");
            var l=Teacher.Get();
            foreach (var item in l)
            {
                Console.WriteLine(item);
            }
            LogManager.LogException(new Exception("be carefull"));*/
            BL.AbsenceForTeacher.Add(new AbsencesForTeacherDTO() {
                FromDate = DateTime.Now,
                ToDate = DateTime.Now,
                TeacherId = 779,
                Type = 1,
                TeacherStandIn=780
            });
               
          

        }
    }
}
