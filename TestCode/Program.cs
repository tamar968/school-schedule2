using BL;
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
           
            xmlManager.LoadDirectory(@"Y:\group 2 תשעט\הכהן עדני תמר\קבצים לפרויקט\תלמש\Talmash\חשון עט\");
        }
    }
}
