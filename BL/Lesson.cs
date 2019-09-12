using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Lesson
    {
        public static void Add(ScheduleDTO lesson)
        {
            using (Entities db = new Entities())
            {
                db.Schedules.Add(_CastDTO.DTOToSchedule(lesson));
                db.SaveChanges();
            }
        }
        public static void Update(ScheduleDTO lesson)
        {
            using (Entities db = new Entities())
            {
                var dairy = db.Schedules.FirstOrDefault(l => l.Id == lesson.Id);
                dairy.CalculateHours = lesson.CalculateHours;
                dairy.Cause = lesson.Cause;
                dairy.GroupId = lesson.GroupId;
                dairy.FromDate = _CastDTO.DTOToDate(lesson.FromDate);
                dairy.ToDate = _CastDTO.DTOToDate(lesson.ToDate);
                dairy.Hour = lesson.Hour;
                dairy.IsGrouped = lesson.IsGrouped;
                dairy.Num = lesson.Num;
                dairy.OccasionId = lesson.OccasionId;
                dairy.SubjectId = lesson.SubjectId;
                dairy.TeacherId = lesson.TeacherId;
                dairy.Reforma = lesson.Reforma;
                dairy.RoomId = lesson.RoomId;
                dairy.TypeId = lesson.TypeId;
                db.SaveChanges();
            }
        }
        public static void Delete(int lessonId)
        {
            using (Entities db = new Entities())
            {
                var dairy = db.Schedules.FirstOrDefault(l => l.Id == lessonId);
                db.Schedules.Remove(dairy);
                db.SaveChanges();
            }
        }
        public static ScheduleDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.ScheduleToDTO(db.Schedules.FirstOrDefault(l => l.Id == id));
            }
        }
        public static List<ScheduleDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.ScheduleToDTO(db.Schedules.ToList());
            }
        }
    }
}
