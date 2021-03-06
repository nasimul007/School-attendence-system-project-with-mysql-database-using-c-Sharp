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
    
    public partial class Teacher
    {
        public Teacher()
        {
            this.ClassSectionSubjectTeachers = new HashSet<ClassSectionSubjectTeacher>();
            this.TeacherExpertises = new HashSet<TeacherExpertise>();
        }
    
        public int TeacherId { get; set; }
        public int EmployeeId { get; set; }
        public string Email { get; set; }
        public int DesignationId { get; set; }
    
        public virtual ICollection<ClassSectionSubjectTeacher> ClassSectionSubjectTeachers { get; set; }
        public virtual Designation Designation { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual ICollection<TeacherExpertise> TeacherExpertises { get; set; }
    }
}
