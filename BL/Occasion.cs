using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Occasion
    {
        public static void Add(OccasionDTO occasion)
        {
            using (Entities db = new Entities())
            {
                db.Occasions.Add(_CastDTO.DTOToOccasion(occasion));
                db.SaveChanges();
            }
        }
        public static void Update(OccasionDTO occasion)
        {
            using (Entities db = new Entities())
            {
                var occ = db.Occasions.FirstOrDefault(o => o.Id == occasion.Id);
                occ.Id = occasion.Id;
                occ.OccasionType = occasion.OccasionType;
                occ.FromDate = _CastDTO.DTOToDate(occasion.FromDate);
                occ.ToDate = _CastDTO.DTOToDate(occasion.ToDate);
                db.SaveChanges();
            }
        }
        public static void Delete(OccasionDTO occasion)
        {
            using (Entities db = new Entities())
            {
                var occ = db.Occasions.FirstOrDefault(o => o.Id == occasion.Id);
                db.Occasions.Remove(occ);
                db.SaveChanges();
            }
        }
        public static List<OccasionDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.OccasionToDTO(db.Occasions.ToList());
            }
        }
        public static OccasionDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.OccasionToDTO(db.Occasions.FirstOrDefault(o => o.Id == id));
            }
        }
    }
}

