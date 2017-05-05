using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UsersPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            GetAllCoursesForThisUser();
            GetAllCourses();

            string userid = HttpContext.Current.User.Identity.Name;
            UserDB udb = new UserDB();
            User user = udb.GetUser(userid);
            (UserProfileUpdate.FindControl("txtFName") as TextBox).Text = user.FName;
            (UserProfileUpdate.FindControl("txtLName") as TextBox).Text = user.LName;
            (UserProfileUpdate.FindControl("txtPhoneNumber") as TextBox).Text = user.Phone;
            (UserProfileUpdate.FindControl("txtQualification") as TextBox).Text = user.Qualification;
            (UserProfileUpdate.FindControl("txtAddress") as TextBox).Text = user.Address;
            (UserProfileUpdate.FindControl("txtSecurityQuestion") as DropDownList).Text = user.Forgot_Question;
            (UserProfileUpdate.FindControl("txtSecurityQuestionAnswer") as TextBox).Text = user.Answer;       
        }
    }

    protected void btnSubmtChnages_Click(object sender, EventArgs e)
    {

        string userid = HttpContext.Current.User.Identity.Name;

        string phoneNumber = (UserProfileUpdate.FindControl("txtPhoneNumber") as TextBox).Text;
        string qualification = (UserProfileUpdate.FindControl("txtQualification") as TextBox).Text;
        string Address = (UserProfileUpdate.FindControl("txtAddress") as TextBox).Text;
        string securityQuestion = (UserProfileUpdate.FindControl("txtSecurityQuestion") as DropDownList).SelectedValue;
        string answer = (UserProfileUpdate.FindControl("txtSecurityQuestionAnswer") as TextBox).Text;
        string password = (UserProfileUpdate.FindControl("txtPassword") as TextBox).Text;
        string comments = (UserProfileUpdate.FindControl("txtComments") as TextBox).Text;
        string experience = "";
        string achievements = "";

        UserDB dbupdateAction = new UserDB();
        dbupdateAction.UpdateCourseAndUser(Address, phoneNumber, userid, securityQuestion, answer, comments, password, qualification, experience, achievements);
    }
    protected void grdviewCources_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = grdviewCources.SelectedRow;
        txtCancelCourseId.Text = row.Cells[1].Text;
        txtCancelCourseName.Text = row.Cells[2].Text;
        txtCancelCoursfee.Text = row.Cells[3].Text;
        txtCancelDescription.Text = row.Cells[4].Text;

      
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int UpdateCourseId = Convert.ToInt32(txtUpdateCourseId.Text);
            string userid = HttpContext.Current.User.Identity.Name;
            UserDB db = new UserDB();
            db.AssociateCourseToUser(UpdateCourseId, userid);
            lblErrorMessage.Text = "Course Enrolled";
            GetAllCoursesForThisUser();
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }
  
   

    private void GetAllCoursesForThisUser()
    {
         string userid = HttpContext.Current.User.Identity.Name;//"faculty@imsystem.com"; //HttpContext.Current.User.Identity.Name;
        IMSystemEntities entity = new IMSystemEntities();
         
        var data = from datavalues in entity.UserVSCourses
                 join courses in entity.Courses on datavalues.CoureseId equals courses.CourseId
                 join users in entity.Users on datavalues.UserId equals users.LoginId
                 where datavalues.UserId == userid
                 select new {
                     CourseId=courses.CourseId,
                     CourseName = courses.CourseName,
                     CourseDescription = courses.Description,
                     Fee = courses.Fees,
                     FacultyName =courses.FAcultyUser.UserId
                 };

        grdviewCources.DataSource = data.ToList();
        grdviewCources.DataBind();

        //decimal totalFee = 0;
        CalucluateDiscount();


        //foreach (GridViewRow rows in grdviewCources.Rows)
        //{

        //    totalFee = totalFee + Convert.ToDecimal(rows.Cells[4].Text);
            
        //}

        //lblCancelCourse.Text ="Total Amount : "+ Convert.ToString(totalFee);

    }
    private void GetAllCourses()
    {
        //string userid = "faculty@imsystem.com"; //HttpContext.Current.User.Identity.Name;
        FacultyDB fdb = new FacultyDB();
        List<Cours> cources = fdb.GetAllCourses();
        GrdCoursesToEnroll.DataSource = cources;
        GrdCoursesToEnroll.DataBind();

    }

    protected void GrdCoursesToEnroll_DataBound(object sender, EventArgs e)
    {

    }
    protected void btnWithdraw_Click(object sender, EventArgs e)
    {
        try
        {
            int UpdateCourseId = Convert.ToInt32(txtCancelCourseId.Text);
            string userid = HttpContext.Current.User.Identity.Name;
            UserDB db = new UserDB();
            db.RemoveCourseToUser(UpdateCourseId, userid);
            lblCancelCourse.Text = "Course Un-Enrolled for you";

            txtCancelCourseId.Text = "";
            txtCancelCourseName.Text = "";
            txtCancelCoursfee.Text = "";
            txtCancelDescription.Text = "";
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        GetAllCoursesForThisUser();
    
    }
    protected void GrdCoursesToEnroll_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GrdCoursesToEnroll.SelectedRow;
        txtUpdateCourseId.Text = row.Cells[1].Text;
        txtUpdateCourseName.Text = row.Cells[2].Text;
        txtUpdateFee.Text = row.Cells[3].Text;
        txtUpdateDescription.Text = row.Cells[4].Text;

        txtUpdateStartDate.Text = row.Cells[6].Text.Trim().Replace("&nbsp;", "");
        txtUpdateEndDate.Text = row.Cells[7].Text.Trim().Replace("&nbsp;", "");

      



    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView2.SelectedRow;
        txtCancelCourseId.Text = row.Cells[1].Text;
        txtCancelCourseName.Text = row.Cells[2].Text;
        txtCancelCoursfee.Text = row.Cells[3].Text;
        txtCancelDescription.Text = row.Cells[4].Text;
    }
    protected void rbtPaymentOptions_SelectedIndexChanged(object sender, EventArgs e)
    {

        CalucluateDiscount();
    }
    private void CalucluateDiscount()
    {
         string selectedPaymentOption = rbtPaymentOptions.SelectedValue;
         decimal totalFee = 0;
        int totalCourses=grdviewCources.Rows.Count;
        foreach (GridViewRow rows in grdviewCources.Rows)
        {

            totalFee = totalFee + Convert.ToDecimal(rows.Cells[4].Text);
            
        }
         if(totalCourses>2)
                {
                   totalFee =   totalFee - (totalFee * 1)/100;
                }


         lbldiscount.Text = "The Fee will be " + totalFee.ToString("0.00");


         if (totalCourses == 1)
         {
             lbldiscount.Text = "The Fee will be " + totalFee.ToString("0.00");
         }
         else if (totalCourses == 2)
         {
             totalFee = totalFee - (totalFee * 5) / 100;
             lbldiscount.Text = "The Fee will be " + totalFee.ToString();
         }
         else if (totalCourses == 3)
         {

             totalFee = totalFee - (totalFee * 20) / 100;
             lbldiscount.Text = "The Fee will be " + totalFee.ToString();
         }
         else
         {
             lbldiscount.Text = "The Fee will be " + totalFee.ToString("0.00");
         }

        string alertmessage = "The final fee is :" + totalFee.ToString();
        switch (selectedPaymentOption)
        {
            case "CC":
               
                totalFee = totalFee + (totalFee * Convert.ToDecimal(2.5))/100;
                alertmessage="The final fee with the selected payment option is :" + totalFee.ToString() +"; 3% Service Charge applied";
                break;
            case "DC":
                 totalFee = totalFee + (totalFee * Convert.ToDecimal(1.5))/100;
                alertmessage="The final fee with the selected payment option is :" + totalFee.ToString() +"; 1.5% Service Charge applied";
                break;
            case "NB":
                totalFee = totalFee + (totalFee * Convert.ToDecimal(0.5)) / 100;
                alertmessage="The final fee with the selected payment option is :" + totalFee.ToString() +"; 0.5% Service Charge applied";
                break;
            case "PC":
                totalFee = totalFee - (totalFee * Convert.ToDecimal(0.5)) / 100;
                alertmessage="The final fee with the selected payment option is :" + totalFee.ToString() +"; .5% Discount applied";
                break;
        }
       
        alertmessage = alertmessage+ Environment.NewLine+"* 1% discount on fee in case of student joined more than two courses";
        lblCancelCourse.Text = alertmessage;
    }
}