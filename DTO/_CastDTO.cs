﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class _CastDTO
    {
        #region Absence
        public static AbsenceDTO AbsenceToDTO(Absence abs)
        {
            return new AbsenceDTO() { Id = abs.Id, Name = abs.Name };
        }
        public static List<AbsenceDTO> AbsenceToDTO(List<Absence> absList)
        {
            return absList.Select(a => AbsenceToDTO(a)).ToList();
        }
        public static Absence DTOToAbsence(AbsenceDTO abs)
        {
            return new Absence() { Id = abs.Id, Name = abs.Name };
        }
        public static List<Absence> DTOToAbsence(List<AbsenceDTO> absList)
        {
            return absList.Select(a => DTOToAbsence(a)).ToList();
        }
        #endregion
        #region AbsenceForTeacher
        public static AbsencesForTeacherDTO AbsencesForTeacherToDTO(AbsencesForTeacher absForTea)
        {
            return new AbsencesForTeacherDTO() { Id = absForTea.Id, TeacherId = absForTea.TeacherId, TeacherStandIn = absForTea.TeacherStandIn, FromDate = absForTea.FromDate, ToDate = absForTea.ToDate };
        }
        public static List<AbsencesForTeacherDTO> AbsencesForTeacherToDTO(List<AbsencesForTeacher> absForTeaList)
        {
            return absForTeaList.Select(a => AbsencesForTeacherToDTO(a)).ToList();
        }
        public static AbsencesForTeacher DTOToAbsencesForTeacher(AbsencesForTeacherDTO absForTea)
        {
            return new AbsencesForTeacher() { Id = absForTea.Id, TeacherId = absForTea.TeacherId, TeacherStandIn = absForTea.TeacherStandIn, FromDate = absForTea.FromDate, ToDate = absForTea.ToDate };
        }
        public static List<AbsencesForTeacher> DTOToAbsencesForTeacher(List<AbsencesForTeacherDTO> absForTeaList)
        {
            return absForTeaList.Select(a => DTOToAbsencesForTeacher(a)).ToList();
        }
        #endregion
        #region Class
        public static ClassDTO ClassToDTO(Class cls)
        {
            return new ClassDTO() { Id = cls.Id, Name = cls.Name, Layer = cls.Layer, Num = cls.Num, Number = cls.Number, SchoolType = cls.SchoolType };
        }
        public static List<ClassDTO> ClassToDTO(List<Class> clsList)
        {
            return clsList.Select(a => ClassToDTO(a)).ToList();
        }
        public static Class DTOToClass(ClassDTO cls)
        {
            return new Class() { Id = cls.Id, Name = cls.Name, Layer = cls.Layer, Num = cls.Num, Number = cls.Number, SchoolType = cls.SchoolType };
        }
        public static List<Class> DTOToClass(List<ClassDTO> clsList)
        {
            return clsList.Select(a => DTOToClass(a)).ToList();
        }
        #endregion
        #region Dairy
        public static DairyDTO DairyToDTO(Dairy dairy)
        {
            return new DairyDTO()
            {
                Id = dairy.Id,
                ClassId = dairy.ClassId,
                Num = dairy.Num,
                CalculateHours = dairy.CalculateHours,
                Cause = dairy.Cause,
                FromDate = dairy.FromDate,
                Hour = dairy.Hour,
                IsGrouped = dairy.IsGrouped,
                OccasionId = dairy.OccasionId,
                Reforma = dairy.Reforma,
                RoomId = dairy.RoomId,
                SubjectId = dairy.SubjectId,
                TeacherId = dairy.TeacherId,
                ToDate = dairy.ToDate,
                TypeId = dairy.TypeId
            };
        }
        public static List<DairyDTO> DairyToDTO(List<Dairy> dairyList)
        {
            return dairyList.Select(a => DairyToDTO(a)).ToList();
        }
        public static Dairy DTOToDairy(DairyDTO dairy)
        {
            return new Dairy()
            {
                Id = dairy.Id,
                ClassId = dairy.ClassId,
                Num = dairy.Num,
                CalculateHours = dairy.CalculateHours,
                Cause = dairy.Cause,
                FromDate = dairy.FromDate,
                Hour = dairy.Hour,
                IsGrouped = dairy.IsGrouped,
                OccasionId = dairy.OccasionId,
                Reforma = dairy.Reforma,
                RoomId = dairy.RoomId,
                SubjectId = dairy.SubjectId,
                TeacherId = dairy.TeacherId,
                ToDate = dairy.ToDate,
                TypeId = dairy.TypeId
            };
        }
        public static List<Dairy> DTOToDairy(List<DairyDTO> dairyList)
        {
            return dairyList.Select(a => DTOToDairy(a)).ToList();
        }
        #endregion
        #region Group
        public static GroupDTO GroupToDTO(Group grp)
        {
            return new GroupDTO()
            {
                Id = grp.Id,
                CalculateHours = grp.CalculateHours,
                Hours = grp.Hours,
                HourType = grp.HourType,
                SubHourType = grp.SubHourType,
                Num = grp.Num,
                PayAbsence = grp.PayAbsence,
                Reforma = grp.Reforma,
                Room = grp.Room,
                SchoolType = grp.SchoolType,
                Subject = grp.Subject,
                Teacher = grp.Teacher
            };
        }
        public static List<GroupDTO> GroupToDTO(List<Group> grpList)
        {
            return grpList.Select(g => GroupToDTO(g)).ToList();
        }
        public static Group DTOToGroup(GroupDTO grp)
        {
            return new Group()
            {
                Id = grp.Id,
                CalculateHours = grp.CalculateHours,
                Hours = grp.Hours,
                HourType = grp.HourType,
                SubHourType = grp.SubHourType,
                Num = grp.Num,
                PayAbsence = grp.PayAbsence,
                Reforma = grp.Reforma,
                Room = grp.Room,
                SchoolType = grp.SchoolType,
                Subject = grp.Subject,
                Teacher = grp.Teacher
            };
        }
        public static List<Group> DTOToGroup(List<GroupDTO> grpList)
        {
            return grpList.Select(g => DTOToGroup(g)).ToList();
        }
        #endregion
        #region HourType
        public static HourTypeDTO HourTypeToDTO(HourType ht)
        {
            return new HourTypeDTO() { Id = ht.Id, Name = ht.Name, ParentId = ht.ParentId };
        }
        public static List<HourTypeDTO> HourTypeToDTO(List<HourType> htList)
        {
            return htList.Select(ht => HourTypeToDTO(ht)).ToList();
        }
        public static HourType DTOToHourType(HourTypeDTO ht)
        {
            return new HourType() { Id = ht.Id, Name = ht.Name, ParentId = ht.ParentId };
        }
        #endregion
        #region Occasion
        public static OccasionDTO OccasionToDTO(Occasion occ)
        {
            return new OccasionDTO()
            {
                Id = occ.Id,
                FromDate = occ.FromDate,
                ToDate = occ.ToDate,
                OccasionType = occ.OccasionType
            };
        }
        public static List<OccasionDTO> OccasionToDTO(List<Occasion> occList)
        {
            return occList.Select(a => OccasionToDTO(a)).ToList();
        }
        public static Occasion DTOToOccasion(OccasionDTO occ)
        {
            return new Occasion()
            {
                Id = occ.Id,
                FromDate = occ.FromDate,
                ToDate = occ.ToDate,
                OccasionType = occ.OccasionType
            };
        }
        public static List<Occasion> DTOToOccasion(List<OccasionDTO> occList)
        {
            return occList.Select(a => DTOToOccasion(a)).ToList();
        }
        #endregion
        #region OccasionType

        public static OccasionTypeDTO OccasionTypeToDTO(OccasionType occType)
        {
            return new OccasionTypeDTO() { Id = occType.Id, Name = occType.Name };
        }
        public static List<OccasionTypeDTO> OccasionTypeToDTO(List<OccasionType> absList)
        {
            return absList.Select(a => OccasionTypeToDTO(a)).ToList();
        }
        public static OccasionType DTOToOccasionType(OccasionTypeDTO occType)
        {
            return new OccasionType() { Id = occType.Id, Name = occType.Name };
        }
        public static List<OccasionType> DTOToOccasionType(List<OccasionTypeDTO> absList)
        {
            return absList.Select(a => DTOToOccasionType(a)).ToList();
        }
        #endregion
        #region PayAbsence
        public static PayAbsenceDTO PayAbsenceToDTO(PayAbsence payAbs)
        {
            return new PayAbsenceDTO() { Id = payAbs.Id, Name = payAbs.Name, IsStandart = payAbs.IsStandart };
        }
        public static List<PayAbsenceDTO> PayAbsenceToDTO(List<PayAbsence> payList)
        {
            return payList.Select(a => PayAbsenceToDTO(a)).ToList();
        }
        public static PayAbsence DTOToPayAbsence(PayAbsenceDTO payAbs)
        {
            return new PayAbsence() { Id = payAbs.Id, Name = payAbs.Name, IsStandart = payAbs.IsStandart };
        }
        public static List<PayAbsence> DTOToPayAbsence(List<PayAbsenceDTO> payList)
        {
            return payList.Select(a => DTOToPayAbsence(a)).ToList();
        }
        #endregion
        #region Reforma
        public static ReformaDTO ReformaToDTO(Reforma refo)
        {
            return new ReformaDTO() {
                Id = refo.Id,
                Name = refo.Name
            };
        }
        public static List<ReformaDTO> ReformaToDTO(List<Reforma> refoList)
        {
            return refoList.Select(a =>ReformaToDTO(a)).ToList();
        }
        public static Reforma DTOToReforma(ReformaDTO refo)
        {
            return new Reforma() {
                Id=refo.Id,
                Name=refo.Name
            };
        }
        public static List<Reforma> DTOToReforma(List<ReformaDTO> refoList)
        {
            return refoList.Select(a => DTOToReforma(a)).ToList();
        }
        #endregion
        #region Room
        public static RoomDTO RoomToDTO(Room room)
        {
            return new RoomDTO()
            {
                Id = room.Id,
                ClassId = room.ClassId,
                Floor = room.Floor,
                Number = room.Number,
                UseFor = room.UseFor
            };
        }
        public static List<RoomDTO> RoomToDTO(List<Room> rooms)
        {
            return rooms.Select(a => RoomToDTO(a)).ToList();
        }
        public static Room DTOToRoom(RoomDTO room)
        {
            return new Room()
            {
                Id = room.Id,
                ClassId = room.ClassId,
                Floor = room.Floor,
                Number = room.Number,
                UseFor = room.UseFor
            };
        }
        public static List<Room> DTOToRoom(List<RoomDTO> rooms)
        {
            return rooms.Select(a => DTOToRoom(a)).ToList();
        }
        #endregion
        #region SchoolType
        public static SchoolTypeDTO SchoolTypeToDTO(SchoolType st)
        {
            return new SchoolTypeDTO()
            {
                Id = st.Id,
                Name = st.Name
            };
        }
        public static List<SchoolTypeDTO> SchoolTypeToDTO(List<SchoolType> stList)
        {
            return stList.Select(st => SchoolTypeToDTO(st)).ToList();
        }
        public static SchoolType DTOToSchoolType(SchoolTypeDTO st)
        {
            return new SchoolType()
            {
                Id = st.Id,
                Name = st.Name
            };
        }
        public static List<SchoolType> DTOToSchoolType(List<SchoolTypeDTO> stList)
        {
            return stList.Select(st => DTOToSchoolType(st)).ToList();
        }
        #endregion
        #region Schedule
        public static ScheduleDTO ScheduleToDTO(Schedule schedule)
        {
            return new ScheduleDTO()
            {
                Day = schedule.Day,
                Hour = schedule.Hour,
                Num = schedule.Num,
                Room = schedule.Room,
                WeekDay = schedule.WeekDay
            };
        }
        public static List<ScheduleDTO> ScheduleToDTO(List<Schedule> schList)
        {
            return schList.Select(s => ScheduleToDTO(s)).ToList();
        }
        public static Schedule DTOToSchedule(ScheduleDTO schedule)
        {
            return new Schedule()
            {
                Day = schedule.Day,
                Hour = schedule.Hour,
                Num = schedule.Num,
                Room = schedule.Room,
                WeekDay = schedule.WeekDay
            };
        }
        public static List<Schedule> DTOToSchedule(List<ScheduleDTO> schList)
        {
            return schList.Select(a => DTOToSchedule(a)).ToList();
        }
        #endregion
        #region Subject
        public static SubjectDTO SubjectToDTO(Subject sub)
        {
            return new SubjectDTO() { Id = sub.Id, Name = sub.Name };
        }
        public static List<SubjectDTO> SubjectToDTO(List<Subject> subList)
        {
            return subList.Select(s => SubjectToDTO(s)).ToList();
        }
        public static Subject DTOToSubject(SubjectDTO sub)
        {
            return new Subject() { Id = sub.Id, Name = sub.Name };
        }
        public static List<Subject> DTOToSubject(List<SubjectDTO> subList)
        {
            return subList.Select(s => DTOToSubject(s)).ToList();
        }
        #endregion
        #region Teacher
        public static TeacherDTO TeacherToDTO(Teacher teacher)
        {
            return new TeacherDTO() { Id = teacher.Id, Name = teacher.Name, Num = teacher.Num };
        }
        public static List<TeacherDTO> TeacherToDTO(List<Teacher> teacherList)
        {
            return teacherList.Select(t => TeacherToDTO(t)).ToList();
        }
        public static Teacher DTOToTeacher(TeacherDTO teacher)
        {
            return new Teacher() { Id = teacher.Id, Name = teacher.Name, Num = teacher.Num };
        }
        public static List<Teacher> DTOToTeacher(List<TeacherDTO> teacherList)
        {
            return teacherList.Select(t => DTOToTeacher(t)).ToList();
        }
        #endregion
    }
}