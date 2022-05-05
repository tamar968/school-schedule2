﻿using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Teacher
    {public static void Add(TeacherDTO teacher)
        {
            using (Entities db = new Entities())
            {
                db.Teachers.Add(_CastDTO.DTOToTeacher(teacher));
                db.SaveChanges();
            }
        }
        public static void Update(TeacherDTO teacher)
        {
            using (Entities db = new Entities())
            {
                var abs = db.Teachers.FirstOrDefault(t => t.Num == teacher.Num);
                 abs.Name =teacher.Name;
                db.SaveChanges();
            }
        }
        public static void Delete(int teacherId)
        {
            using (Entities db = new Entities())
            {
                var abs = db.Teachers.FirstOrDefault(t => t.Num == teacherId);
                db.Teachers.Remove(abs);
                db.SaveChanges();
            }
        }
        public static List<TeacherDTO> Get()
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.TeacherToDTO(db.Teachers.ToList());
            }
        }
        public static TeacherDTO Get(int id)
        {
            using (Entities db = new Entities())
            {
                return _CastDTO.TeacherToDTO(db.Teachers.FirstOrDefault(l => l.Num == id));
            }
        }
    }
}
