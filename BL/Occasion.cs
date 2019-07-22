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
                DAL.Occasion occasionDb = _CastDTO.DTOToOccasion(occasion);
                db.Occasions.Add(occasionDb);
                occasion.Teachers = new HashSet<int>();
                var teachers = db.Teachers.Where(t => occasion.Teachers.Contains(t.Id));
                foreach (DAL.Teacher teacher in teachers)
                {
                    occasionDb.Teachers.Add(teacher);
                }
                occasion.Classes = new HashSet<int>();
                var classes = db.Classes.Where(c => occasion.Classes.Contains(c.Id));
                foreach (DAL.Class cls in classes)
                {
                    occasionDb.Classes.Add(cls);
                }
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
        public static void Delete(int occasionId)
        {
            using (Entities db = new Entities())
            {
                var occ = db.Occasions.FirstOrDefault(o => o.Id == occasionId);
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

