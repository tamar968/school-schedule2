//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class AbsencesForTeacher
    {
        public int Id { get; set; }
        public int TeacherId { get; set; }
        public System.DateTime FromDate { get; set; }
        public System.DateTime ToDate { get; set; }
        public Nullable<int> TeacherStandIn { get; set; }
    
        public virtual Absence Absence { get; set; }
        public virtual Teacher Teacher { get; set; }
        public virtual Teacher Teacher1 { get; set; }
    }
}