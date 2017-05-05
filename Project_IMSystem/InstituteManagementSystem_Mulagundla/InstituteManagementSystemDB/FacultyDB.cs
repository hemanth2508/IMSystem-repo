using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstituteManagementSystemDB
{
   public class FacultyDB
    {
       public bool CreateCourse(string Userid, string CourseName, string Description, decimal Fees,int noOfSeats, DateTime? CourseStartDate,DateTime? CourseEndDate,string starttime,string endTime)
       {

           IMSystemEntities entity = new IMSystemEntities();
           try
           {
               FAcultyUser fuser = entity.FAcultyUsers.Where(f => f.UserId.Equals(Userid)).FirstOrDefault<FAcultyUser>();

               TimeSpan time1;
                if (!TimeSpan.TryParse(starttime, out time1))
                {
                    // handle validation error
                }
               TimeSpan time2;
                if (!TimeSpan.TryParse(endTime, out time2))
                {
                    // handle validation error
                }
               if (fuser != null)
               {

                   Cours course = new Cours();
                   course.CourseName = CourseName;
                   course.Description = Description;
                   course.Fees = Fees;
                   course.CourseStartDate = CourseStartDate;
                   course.CourseEndDate = CourseEndDate;
                   course.FAcultyUser = fuser;
                   course.IsActive = true;
                   course.NoOfSeats = noOfSeats;
                   course.StartTime = time1;
                   course.EndTime = time2;
                   entity.Courses.Add(course);
                   entity.SaveChanges();
                   return true;
               }
           }catch(Exception)
           {
               throw;
           }
           return false;
       }

       public bool IsFacultyUser(string UserId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               FAcultyUser fuser = entity.FAcultyUsers.Where(f => f.UserId.Equals(UserId)).FirstOrDefault<FAcultyUser>();

               return fuser != null;
           }
           catch(Exception)
           {
               throw;
           }
       }

       public List<Cours> GetAllCourseOfFaculty(string UserId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               var courses = entity.Courses.Where(f => f.FAcultyUser.UserId.Equals(UserId)).ToList<Cours>();

               return courses;
           }
           catch (Exception)
           {
               throw;
           }
       }
       public List<Cours> GetAllCourses()
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               var courses = entity.Courses.Where(f => f.IsActive.Equals(true) 
                   && entity.UserVSCourses.Where(uc=>uc.CoureseId==f.CourseId).Count() < f.NoOfSeats ).ToList<Cours>();

               return courses;
           }
           catch (Exception)
           {
               throw;
           }
       }
       public List<Cours> GetAllCoursesIgnoreStatus()
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               var courses = entity.Courses.ToList<Cours>();

               return courses;
           }
           catch (Exception)
           {
               throw;
           }
       }
       public bool DeleteCourse(int CourseId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               int uvc = entity.UserVSCourses.Where(c => c.CoureseId == CourseId).Count();
               if (uvc > 0)
                   throw new Exception("The course is associated with users, can't delete at this moment");

               Cours course = entity.Courses.Where(f => (f.CourseId == CourseId)).FirstOrDefault<Cours>();
               if (course != null)
               {
                   entity.Courses.Remove(course);
                   entity.SaveChanges();
               }
               return true;
           }
           catch (Exception)
           {
               throw;
           }
           return false;
       }

       public bool DeleteAllCourse(string UserId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               var courses = entity.Courses.Where(f => f.FAcultyUser.UserId.Equals(UserId)).ToList<Cours>();

               foreach (Cours cours in courses)
               {
                   int courseid = cours.CourseId;
                   int uvc = entity.UserVSCourses.Where(c => c.CoureseId == courseid).Count();
                   if (uvc > 0)
                       throw new Exception("Few courses beling to this tutor is associated with Students, can't delete at this moment");
               }

               entity.Courses.RemoveRange(courses);
               entity.SaveChanges();
               return true;
           }
           catch (Exception)
           {
               throw;
           }
           return false;
       }

       public bool DisableCourse(int CourseId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               Cours course = entity.Courses.Where(f => (f.CourseId == CourseId)).FirstOrDefault<Cours>();

               int uvc = entity.UserVSCourses.Where(c => c.CoureseId == CourseId).Count();
               if (uvc > 0)
                   throw new Exception("The course is associated with Students, can't Disable at this moment");

               if (course.IsActive)
               {
                   course.IsActive = false;

                   entity.SaveChanges();
                   return true;
               }
           }
           catch (Exception)
           {
               throw;
           }
           return false;
       }
       public bool EnableCourse(int CourseId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               Cours course = entity.Courses.Where(f => (f.CourseId == CourseId)).FirstOrDefault<Cours>();

               if (!course.IsActive)
               {
                   course.IsActive = true;

                   entity.SaveChanges();
                   return true;
               }
           }
           catch (Exception)
           {
               throw;
           }
           return false;
       }
       public bool UpdateCourse(int CourseId, string CourseName, string Description,int NoOfSeats, decimal Fees, DateTime? CourseStartDate, DateTime? CourseEndDate, string starttime, string endTime)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               Cours course = entity.Courses.Where(f => (f.CourseId == CourseId)).FirstOrDefault<Cours>();
               TimeSpan time1;
               if (!TimeSpan.TryParse(starttime, out time1))
               {
                   // handle validation error
               }
               TimeSpan time2;
               if (!TimeSpan.TryParse(endTime, out time2))
               {
                   // handle validation error
               }
               if(course.IsActive)
               {
                  
                     course.CourseName = CourseName;

                    course.Description = Description;
                    course.NoOfSeats = NoOfSeats;
                   course.Fees = Fees;
                   course.CourseStartDate = CourseStartDate;
                   course.CourseEndDate = CourseEndDate;
                   course.StartTime = time1;
                   course.EndTime = time2;
                   entity.SaveChanges();
                   return true;
               }
           }
           catch (Exception)
           {
               throw;
           }
           return false;
       }
    }
}
