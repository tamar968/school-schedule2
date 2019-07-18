using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Absence
    {
        public static void Add(AbsenceDTO absence)
        {
            using (Entities db = new Entities())
            {
                db.Absences.Add(_CastDTO.DTOToAbsence(absence));
                db.SaveChanges();
            }
        }
        public static void Update(AbsenceDTO absence)
        {
            using (Entities db = new Entities())
            {
                var abs = db.Absences.FirstOrDefault(a => a.Id == absence.Id);
                 abs.Name =absence.Name;
                db.SaveChanges();
            }
        }
        public static void Delete(int absenceId)
        {
            using (Entities db = new Entities())
            {
                var abs = db.Absences.FirstOrDefault(a => a.Id == absenceId);
                db.Absences.Remove(abs);
                db.SaveChanges();
            }
        }
        public static List<AbsenceDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsenceToDTO(db.Absences.ToList());
            }
        }
        public static AbsenceDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.AbsenceToDTO(db.Absences.FirstOrDefault(l => l.Id == id));
            }
        }
    }
}
