using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    enum eDayName
    {

    }
    class Schedule
    {
        public List<string> ColumnTitles { get; set; }
        public List<string> RowTitles { get; set; }
        public List<List<StudyTime>> Cells { get; set; }

        public List<List<ScheduleDTO>> GetScheduleByTeacher(int teacherId, DateTime date)
        {
            using (Entities db = new Entities())
            {
                return OrderByDays( _CastDTO.ScheduleToDTO((db.Schedules.Where(l => l.TeacherId == teacherId)).ToList()), date);
            }
        }
        public List<List<ScheduleDTO>> GetScheduleByClass(int classId, DateTime date)
        {
            using (Entities db = new Entities())
            {
                return OrderByDays(_CastDTO.ScheduleToDTO((db.Schedules.Where(l => l.ClassId == classId)).ToList()),date);
            }
        }
        public List<ScheduleDTO> GetScheduleByDate(DateTime date)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.ScheduleToDTO((db.Schedules.Where(l => (date >= l.FromDate && date <= l.ToDate))).ToList());
            }
        }
        public List<List<ScheduleDTO>> OrderByDays(List<ScheduleDTO> scheduleDTOList, DateTime date)
        {
            List<List<ScheduleDTO>> sch = new List<List<ScheduleDTO>>();
            for (int day = 0; day < (int)DayOfWeek.Saturday; day++)
            {
                sch.Add(scheduleDTOList.Where(l => l.FromDate.Day == day).ToList());
            }
            return sch;
        }
    }
}
