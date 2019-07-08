using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class OccasionType
    {
        public static void Add(OccasionTypeDTO occasionType)
        {
            using (Entities db = new Entities())
            {
                db.OccasionTypes.Add(_CastDTO.DTOToOccasionType(occasionType));
                db.SaveChanges();
            }
        }
        public static void Update(OccasionTypeDTO occasionType)
        {
            using (Entities db = new Entities())
            {
                var occTp = db.OccasionTypes.FirstOrDefault(l => l.Id == occasionType.Id);
                occTp.Id=occasionType.Id;
                occTp.Name=occasionType.Name;
                db.SaveChanges();
            }
        }
        public static void Delete(OccasionTypeDTO occasionType)
        {
            using (Entities db = new Entities())
            {
                var occTp = db.OccasionTypes.FirstOrDefault(ot => ot.Id == occasionType.Id);
                db.OccasionTypes.Remove(occTp);
                db.SaveChanges();
            }
        }
        public static List<OccasionTypeDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.OccasionTypeToDTO(db.OccasionTypes.ToList());
            }
        }
        public static OccasionTypeDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.OccasionTypeToDTO(db.OccasionTypes.FirstOrDefault(ot => ot.Id == id));
            }
        }
    }
}
