using DAL;
using DTO;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    class Schedule
    {
        public List<string> ColumnTitles { get; set; }
        public List<string> RowTitles { get; set; }
        public List<List<StudyTime>> Cells { get; set; }

        public List<List<string>> GetScheduleByTeacher(int teacherId)
        {
            using (Entities db = new Entities())
            {
             //   return _CastDTO.TeacherToDTO(db.Schedules.Where(l => l. ));

            }
            return null;
        }
    }
}
