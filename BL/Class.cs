using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Class
    {

        enum eLayers
        {
            ט = 9,
            י = 10,
            יא = 11,
            יב = 12
            , יג = 13
            , יד = 14
        }


        public static Dictionary<int, List<ClassDTO>> ClassByLayer { get; } = new Dictionary<int, List<ClassDTO>>();

        static Class()
        {
            for (int i = 9; i < 15; i++)
            {
                ClassByLayer.Add(i, GetClassByLayer(i));
            }
        }
        public static void Add(ClassDTO _class)
        {
            using (Entities db = new Entities())
            {
                db.Classes.Add(_CastDTO.DTOToClass(_class));
                db.SaveChanges();
            }
        }
        public static void Update(ClassDTO _class)
        {
            using (Entities db = new Entities())
            {
                var cls = db.Classes.FirstOrDefault(c => c.Id == _class.Id);
                cls.Name = _class.Name;
                cls.Layer = _class.Layer;
                cls.Num = _class.Num;
                cls.Number = _class.Number;
                cls.SchoolType = _class.SchoolType;
                db.SaveChanges();
            }
        }
        public static void Delete(int _classId)
        {
            using (Entities db = new Entities())
            {
                var cls = db.Classes.FirstOrDefault(c => c.Id == _classId);
                db.Classes.Remove(cls);
                db.SaveChanges();
            }
        }
        public static ClassDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.ClassToDTO(db.Classes.FirstOrDefault(c => c.Id == id));
            }
        }
        public static List<ClassDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.ClassToDTO(db.Classes.ToList());
            }
        }
        private static List<ClassDTO> GetClassByLayer(int layer)
        {

            using (Entities db = new Entities())
            {
                return _CastDTO.ClassToDTO(db.Classes.Where(c => c.Layer == layer).ToList());
            }
        }
        public static List<ClassDTO> GetByLayers(List<int> layers)
        {
            List<ClassDTO> classes = new List<ClassDTO>();
            if (layers.Contains(0))
            {
                for (int i = 9; i < 15; i++)
                {
                    classes.AddRange(ClassByLayer[i]);
                }
                return classes;
            }
            foreach (int i in layers)
            {
                classes.AddRange(ClassByLayer[i]);
            }
            return classes;
        }
    }
}
