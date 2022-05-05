using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class ScheduleRequest : IComparable
    {
        public string TeacherName { get; set; }
        public string SubjectName { get; set; }
        public string Color { get; set; }
        public int RowSpan { get; set; }
        public string EditUrl { get; set; }
        public int WeekDay { get; set; }
        public int Hour { get; set; }
        public int Cls { get; set; }
        public string Layer { get; set; }
        public string ClsNum { get; set; }
        public int CompareTo(object obj)
        {
            return Hour - (obj as ScheduleRequest).Hour;
        }

        public readonly static Dictionary<int, string> pairs = new Dictionary<int, string>
            {
                { 9, "ט" },
                { 10, "י" },
                { 11, "יא" },
                { 12, "יב" },
                { 13, "יג" },
                { 14, "יד" }
            };

        public static ScheduleRequest CastDairyDTOToScheduleRequest(DairyDTO dairy)
        {
            return null;
        }
        public static ScheduleRequest CastScheduleToScheduleRequest(Schedule s)
        {
            var cls = s.Group.Classes.FirstOrDefault();
            if (cls != null)
                return new ScheduleRequest
                {
                    TeacherName = s.Group.Teacher1.Name,
                    SubjectName = s.Group.Subject1.Name,
                    Color = s.Group.Subject1.Color,
                    RowSpan = 1,
                    EditUrl = "login",
                    Layer = pairs[cls.Layer],
                    Cls = cls.Num,
                    ClsNum = cls.Number.ToString(),
                    Hour = s.Hour,
                    WeekDay = s.WeekDay
                };
            else
                throw new Exception ("CastScheduleToScheduleRequest");
        }
        public static List<ScheduleRequest> CastScheduleToScheduleRequestList(Schedule s)
        {
            List<ClassDTO> classes = _CastDTO.ClassToDTO(s.Group.Classes.ToList());
            List<ScheduleRequest> newList = new List<ScheduleRequest>();
            if(classes!=null&&classes.Count>0)
            foreach (var cls in classes)
            {
                    if(cls!=null)
                newList.Add(
                    new ScheduleRequest
                    {
                        TeacherName = s.Group.Teacher1?.Name,
                        SubjectName = s.Group.Subject1?.Name,
                        Color = s.Group.Subject1?.Color,
                        RowSpan = 1,
                        EditUrl = "login",
                        Layer = pairs[cls.Layer],
                        Cls = cls.Num,
                        ClsNum = cls.Number.ToString(),
                        Hour = s.Hour,
                        WeekDay = s.WeekDay
                    }
                    );
            }
            return newList;
        }

        public static List<ScheduleRequest> CastScheduleToScheduleRequest(List<Schedule> ScheduleList)
        {
            var sch = new List<ScheduleRequest>();
            foreach (var s in ScheduleList)
            {
                sch.Add(CastScheduleToScheduleRequest(s));
            }
            return sch;
        }

    }
}
