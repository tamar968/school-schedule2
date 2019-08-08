using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Subject
    {
        public static void Add(SubjectDTO _Subject)
        {
            using (Entities db = new Entities())
            {
                db.Subjects.Add(_CastDTO.DTOToSubject(_Subject));
                db.SaveChanges();
            }
        }
        public static void Update(SubjectDTO Subject)
        {
            using (Entities db = new Entities())
            {
                var subj = db.Subjects.FirstOrDefault(s => s.Id == Subject.Id);
                subj.Name = Subject.Name;
                db.SaveChanges();
            }
        }
        public static void Delete(int SubjectId)
        {
            using (Entities db = new Entities())
            {
                var subj = db.Subjects.FirstOrDefault(s => s.Id == SubjectId);
                db.Subjects.Remove(subj);
                db.SaveChanges();
            }
        }
        public static SubjectDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.SubjectToDTO(db.Subjects.FirstOrDefault(s => s.Id == id));
            }
        }
        public static List<SubjectDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.SubjectToDTO(db.Subjects.ToList());
            }
        }
    }
}
