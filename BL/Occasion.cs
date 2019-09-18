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
                var teachers = db.Teachers.Where(t => occasion.Teachers.Contains(t.Num));
                foreach (DAL.Teacher teacher in teachers)
                {
                    occasionDb.Teachers.Add(teacher);
                }
                if (occasion.Classes.Count != 0)
                {
                    List<DAL.Class> classes;
                    if (occasion.Classes.First() > 20)
                    {
                        classes = db.Classes.Where(c => occasion.Classes.Contains(c.Num)).ToList();//מיפוי כיתות //Id=>Class
                    }
                    else// אם לא בחרו כיתות נשלחו מחזור/ים במשתנה כיתות 
                    {
                        classes = _CastDTO.DTOToClass(Class.GetByLayers(occasion.Classes.ToList()));
                    }
                    foreach (DAL.Class cls in classes)
                    {
                        occasionDb.Classes.Add(cls);
                    }
                }

                var rooms = db.Rooms.Where(r => occasion.Rooms.Contains(r.Id));
                foreach (DAL.Room room in rooms)
                {
                    occasionDb.Rooms.Add(room);
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
                occ.FromLesson = occasion.FromLesson;
                occ.ToLesson = occasion.ToLesson;
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

