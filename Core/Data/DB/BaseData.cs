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
    
    public partial class BaseData
    {
        public BaseData()
        {
            this.People = new HashSet<Person>();
            this.People1 = new HashSet<Person>();
            this.StudentClassSections = new HashSet<StudentClassSection>();
            this.Users = new HashSet<User>();
        }
    
        public int Id { get; set; }
        public string Value { get; set; }
        public string Category { get; set; }
        public Nullable<int> OrderBy { get; set; }
        public bool IsActive { get; set; }
    
        public virtual ICollection<Person> People { get; set; }
        public virtual ICollection<Person> People1 { get; set; }
        public virtual ICollection<StudentClassSection> StudentClassSections { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
