//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InstituteManagementSystemDB
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserVSCourse
    {
        public int UserVSCourseId { get; set; }
        public string UserId { get; set; }
        public int CoureseId { get; set; }
    
        public virtual UserVSCourse UserVSCourse1 { get; set; }
        public virtual UserVSCourse UserVSCourse2 { get; set; }
    }
}
