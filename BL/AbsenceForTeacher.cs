using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class AbsenceForTeacher
    {
        public static void Add(AbsencesForTeacherDTO absenceForTeacher)
        {
            using (Entities db = new Entities())
            {
                db.AbsencesForTeachers.Add(_CastDTO.DTOToAbsencesForTeacher(absenceForTeacher));
                db.SaveChanges();
            }
        }
        public static void Update(AbsencesForTeacherDTO absenceForTeacher)
        {
            using (Entities db = new Entities())
            {
                var absForTea = db.AbsencesForTeachers.FirstOrDefault(a => a.Id == absenceForTeacher.Id);
                absForTea.TeacherId = absenceForTeacher.TeacherId;
                absForTea.TeacherStandIn = absenceForTeacher.TeacherStandIn;
                absForTea.FromDate = absenceForTeacher.FromDate;
                absForTea.ToDate = absenceForTeacher.ToDate;
                db.SaveChanges();
            }
        }
        public static void Delete(AbsencesForTeacherDTO absenceForTeacher)
        {
            using (Entities db = new Entities())
            {
                var absForTea = db.AbsencesForTeachers.FirstOrDefault(a => a.Id == absenceForTeacher.Id);
                db.AbsencesForTeachers.Remove(absForTea);
                db.SaveChanges();
            }
        }
        public static List<AbsencesForTeacherDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsencesForTeacherToDTO(db.AbsencesForTeachers.ToList());
            }
        }
        public static AbsencesForTeacherDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsencesForTeacherToDTO(db.AbsencesForTeachers.FirstOrDefault(l => l.Id == id));
            }
        }
    }
}
