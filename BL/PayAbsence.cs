using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class PayAbsence
    {
        public static void Create(PayAbsenceDTO payAbsence)
        {
            using (Entities db = new Entities())
            {
                db.PayAbsences.Add(_CastDTO.DTOToPayAbsence(payAbsence));
                db.SaveChanges();
            }
        }
        public static void Update(PayAbsenceDTO payAbsence)
        {
            using (Entities db = new Entities())
            {
                var pAbs = db.PayAbsences.FirstOrDefault(pa => pa.Id == payAbsence.Id);
                pAbs.Id=payAbsence.Id;
                pAbs.Name=payAbsence.Name;
                pAbs.IsStandart=payAbsence.IsStandart;
                db.SaveChanges();
            }
        }
        public static void Delete(PayAbsenceDTO payAbsence)
        {
            using (Entities db = new Entities())
            {
                var pAbs = db.PayAbsences.FirstOrDefault(pa => pa.Id == payAbsence.Id);
                db.PayAbsences.Remove(pAbs);
                db.SaveChanges();
            }
        }
        public static List<PayAbsenceDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.PayAbsenceToDTO(db.PayAbsences.ToList());
            }
        }
        public static PayAbsenceDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.PayAbsenceToDTO(db.PayAbsences.FirstOrDefault(pa => pa.Id == id));
            }
        }
    }
}
