using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    class ScheduleManager
    {
        public List<List<DairyDTO>> GetScheduleByDate(DateTime date, int layer)
        {
            using (Entities db = new Entities())
            {
                return OrderByClass(_CastDTO.DairyToDTO(db.Dairies.Where(lsn => date <= lsn.FromDate && date >= lsn.ToDate && lsn.Classes.Any(c => c.Layer == layer)).ToList()));
            }
        }

        public List<List<DairyDTO>> OrderByClass(List<DairyDTO> schedules)
        {
            List<Dairy> sch = _CastDTO.DTOToDairy(schedules);
            List<List<DairyDTO>> orderSchedule = new List<List<DairyDTO>>();
            int numOfClasses = 10;//TODO change to the web config
            for (int cls = 0; cls < numOfClasses; cls++)
            {
                orderSchedule.Add(_CastDTO.DairyToDTO(sch.Where(s => s.Group.Classes.Any(c => c.Number == cls)).ToList()));
            }
            return orderSchedule;
        }

        public List<List<ScheduleDTO>> OrderByDays(List<ScheduleDTO> groups)
        {
            List<Schedule> sch = _CastDTO.DTOToSchedule(groups);
            List<List<ScheduleDTO>> orderSchedule = new List<List<ScheduleDTO>>();
            int numOfDays = 6;//TODO change to the web config
            for (int day = 0; day < numOfDays; day++)
            {
                orderSchedule.Add(_CastDTO.ScheduleToDTO(sch.Where(lsn => lsn.Day == day).ToList()));
            }
            return orderSchedule;
        }

        public List<List<ScheduleDTO>> GetScheduleByClass(int layer, int number)
        {

            using (Entities db = new Entities())
            {
                return OrderByDays(_CastDTO.ScheduleToDTO(db.Schedules.Where
                    (s => s.Group.Classes.First().Layer == layer
                    && s.Group.Classes.First().Number == number).ToList()));
            }
        }
    }
}
