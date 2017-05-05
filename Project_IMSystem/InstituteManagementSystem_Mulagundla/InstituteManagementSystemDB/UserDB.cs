using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstituteManagementSystemDB
{
  public  class UserDB
    {
      public bool CreateUser(string LName, string FName, string Address, string Phone, string Email, string Forgot_Question, string Answer, string Comments, string Password, string Qualification, string IsFaculty)
        {

            IMSystemEntities entity = new IMSystemEntities();
            try
            {

                User user = entity.Users.Where(f => f.LoginId.Equals(Email)).FirstOrDefault<User>();
                if (user == null)
                {

                    User newUser = new User();
                    newUser.FName = FName;
                    newUser.LName = LName;
                    newUser.LoginId = Email;
                    newUser.password = Password;
                    newUser.Qualification = Qualification;
                    newUser.Phone = Phone;
                    newUser.Email = Email;
                    newUser.Forgot_Question = Forgot_Question;
                    newUser.Answer = Answer;
                    newUser.Comments = Comments;
                    newUser.Status = true;
                    if (IsFaculty.ToUpper().Equals("TRUE") || IsFaculty.ToUpper().Equals("ON"))
                    {
                        newUser.UserType = 2;//Faculty User

                        FAcultyUser fuser = new FAcultyUser();
                        fuser.Experience = "0";
                        fuser.Achievements = "";
                        fuser.UserId = Email;
                        entity.FAcultyUsers.Add(fuser);
                    }
                    else
                    {
                        newUser.UserType = 1;//Normal User
                    }
                    entity.Users.Add(newUser);
                    entity.SaveChanges();
                    return true;
                }
                else
                    throw new Exception("User with the given Email-Id Already exist");
            }
            catch (Exception)
            {
                throw;
            }
            return false;
        }

        public short LogIn(string UserId,string Password)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                User user = entity.Users.Where(f => f.LoginId.Equals(UserId)&& f.password.Equals(Password)).FirstOrDefault<User>();

                if(user!= null)
                {

                    return user.UserType;
                
                }
                else
                {
                    throw new Exception("Invalid UserId or Password");
                }
               
            }
            catch (Exception)
            {
                throw;
            }
            
        }

        public List<User> GetAllUsers()
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                var users = entity.Users.ToList<User>();

                return users;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public User GetUser(string UserId)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                User user = entity.Users.Where(f => (f.LoginId == UserId)).FirstOrDefault<User>();
                //entity.Users.Remove(user);
                //entity.SaveChanges();
                return user;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public bool DeleteUser(string UserId)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                User user = entity.Users.Where(f => (f.LoginId == UserId)).FirstOrDefault<User>();
                FAcultyUser fuser = entity.FAcultyUsers.Where(f => (f.UserId == UserId)).FirstOrDefault<FAcultyUser>();
                if(fuser !=null)
                {
                    int facultyid = fuser.FacultyUsersId;
                    List<Cours> courselist = entity.Courses.Where(f => (f.FacultyId == facultyid)).ToList<Cours>();
                    if (courselist.Count() > 0)
                    {
                        throw new Exception("Coureses are associated with this user, Remove Courses first");
                    }
                    else
                    {
                        entity.FAcultyUsers.Remove(fuser);
                    }
                }
                entity.Users.Remove(user);
                entity.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            return false;
        }

        
        public bool DisableUsesr(string UserId)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                User user = entity.Users.Where(f => (f.LoginId == UserId)).FirstOrDefault<User>();

                if (user.Status == true)
                {
                    user.Status = false;

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
        public bool EnableUser(string UserId)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                User user = entity.Users.Where(f => (f.LoginId == UserId)).FirstOrDefault<User>();

                if (user.Status == false)
                {
                    user.Status = true;

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
        public bool UpdateCourseAndUser(string Address, string Phone, string UserId, string Forgot_Question, string Answer, string Comments, string Password, string Qualification,string Experience,string Achievements)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                User user = entity.Users.Where(f => (f.LoginId == UserId)).FirstOrDefault<User>();
                FAcultyUser fuser = entity.FAcultyUsers.Where(f => f.UserId.Equals(UserId)).FirstOrDefault<FAcultyUser>();
                if (user.Status == true)
                {
                    if (Password != "")
                        user.password = Password;
                    user.Qualification = Qualification;
                    user.Phone = Phone;
                    if (Forgot_Question != "Select Security Question")
                    {
                        user.Forgot_Question = Forgot_Question;
                        user.Answer = Answer;
                    }
                    user.Address = Address;
                    user.Comments = Comments;

                    if (fuser != null)
                    {
                        fuser.Experience = Experience;
                        fuser.Achievements = Achievements;
                    }


                    entity.SaveChanges();
                    return true;
                }
                else
                {
                    throw new Exception("User Status is InActive; Contact the Administrator");
                }
            }
            catch (Exception)
            {
                throw;
            }
            return false;
        }

        public bool UpdateCourse(int courseId, string UpdateCourseName, decimal UpdateCourseFee, string UpdateCourseDescription, DateTime? UpdateCourseStatDate, DateTime? UpdateCourseEndDate)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                Cours course = entity.Courses.Where(f => (f.CourseId == courseId)).FirstOrDefault<Cours>();

                if (course != null && course.IsActive == true)
                {

                    course.CourseName = UpdateCourseName;
                    course.Description = UpdateCourseDescription;
                    course.Fees = UpdateCourseFee;
                    course.CourseStartDate = UpdateCourseStatDate;
                    course.CourseEndDate = UpdateCourseEndDate;


                    entity.SaveChanges();
                    return true;
                }
                else
                {
                    throw new Exception("Course is not active to update.");
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<User> GetAllCourese(string Userid)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                var users = entity.Users.ToList<User>();

                return users;
            }
            catch (Exception)
            {
                throw;
            }
        }

       public void AssociateCourseToUser(int CourseId,string UserId)
        {
            try
            {
                IMSystemEntities entity = new IMSystemEntities();

                Cours course = entity.Courses.Where(c => c.CourseId == CourseId).SingleOrDefault<Cours>();
                if (course == null)
                {
                    throw new Exception("No Course available with Course Id");

                }
                int duplicateAssociation = entity.UserVSCourses.Where(uc => uc.CoureseId == CourseId && uc.UserId== UserId).Count();

                if (duplicateAssociation > 0)
                {
                    throw new Exception("This course is already enrolled");
                }

                int uvc = entity.UserVSCourses.Where(uc => uc.CoureseId == CourseId).Count();

                if (uvc >= course.NoOfSeats)
                {
                    throw new Exception("Seats are full; try next batch");
                }

                var userVSCourses = entity.UserVSCourses.Where(u => u.UserId == UserId);
                foreach (UserVSCourse uc in userVSCourses)
                {
                    Cours course1 = entity.Courses.Where(c => c.CourseId == uc.CoureseId).SingleOrDefault<Cours>();
                    if (course1 != null)
                    {
                        if ((course1.StartTime < course.EndTime && course.StartTime <  course1.EndTime  ))                
                        {
                            throw new Exception("Other Course registered with the same timings; try in next batch");
                        }
                    }
                }

                UserVSCourse userCourse = new UserVSCourse();
                userCourse.UserId = UserId;
                userCourse.CoureseId = CourseId;
                entity.UserVSCourses.Add(userCourse);
                entity.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

       public void RemoveCourseToUser(int CourseId, string UserId)
       {
           try
           {
               IMSystemEntities entity = new IMSystemEntities();

               UserVSCourse userCourse = entity.UserVSCourses.Where(e=>e.CoureseId==CourseId && e.UserId==UserId).FirstOrDefault<UserVSCourse>();
               if (userCourse != null)
               {
                   entity.UserVSCourses.Remove(userCourse);
                   entity.SaveChanges();
               }
           }
           catch (Exception)
           {
               throw;
           }
       }
    }
   

}


