﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class IMSystemEntities : DbContext
    {
        public IMSystemEntities()
            : base("name=IMSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<AdminUser> AdminUsers { get; set; }
        public DbSet<Cours> Courses { get; set; }
        public DbSet<FAcultyUser> FAcultyUsers { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserVSCourse> UserVSCourses { get; set; }
        public DbSet<MarqeeText> MarqeeTexts { get; set; }
    }
}
