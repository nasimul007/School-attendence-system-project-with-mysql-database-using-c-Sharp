//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Core.Data.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class ClassSectionDayPeriodSubject
    {
        public int Id { get; set; }
        public int ClassSectionId { get; set; }
        public int DayId { get; set; }
        public int PeriodId { get; set; }
        public int SubjectId { get; set; }
    
        public virtual ClassSection ClassSection { get; set; }
        public virtual Day Day { get; set; }
        public virtual Period Period { get; set; }
        public virtual Subject Subject { get; set; }
    }
}
