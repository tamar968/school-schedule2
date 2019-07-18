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
                absForTea.FromDate = _CastDTO.DTOToDate(absenceForTeacher.FromDate);
                absForTea.ToDate = _CastDTO.DTOToDate(absenceForTeacher.ToDate);
                db.SaveChanges();
            }
        }
        public static void Delete(int absenceForTeacherId)
        {
            using (Entities db = new Entities())
            {
                var absForTea = db.AbsencesForTeachers.FirstOrDefault(a => a.Id == absenceForTeacherId);
                db.AbsencesForTeachers.Remove(absForTea);
                db.SaveChanges();
            }
        }
        /// <summary>
        /// find all the 
        /// </summary>
        /// <returns>absences for all the teachers</returns>
        public static List<AbsencesForTeacherDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsencesForTeacherToDTO(db.AbsencesForTeachers.ToList());
            }
        }
        /// <summary>
        /// find the absence 
        /// </summary>
        /// <param name="id"></param>
        /// <returns>1 absence for tacher</returns>
        public static AbsencesForTeacherDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsencesForTeacherToDTO(db.AbsencesForTeachers.FirstOrDefault(l => l.Id == id));
            }
        }
        /// <summary>
        /// find all the absences for the teacher (by her id)
        /// </summary>
        /// <param name="id"></param>
        /// <returns>absences for this teacher</returns>
        public static AbsencesForTeacherDTO GetByTeacher(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsencesForTeacherToDTO(db.AbsencesForTeachers.FirstOrDefault(l => l.TeacherId == id));
            }
        }
    }
}
