using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BuildCourseGrid();
            string userid = HttpContext.Current.User.Identity.Name;
            UserDB udb = new UserDB();
            User user= udb.GetUser(userid);
            (UserProfileUpdate.FindControl("txtFName") as TextBox).Text = user.FName;
            (UserProfileUpdate.FindControl("txtLName") as TextBox).Text = user.LName;
            (UserProfileUpdate.FindControl("txtPhoneNumber") as TextBox).Text = user.Phone;
            (UserProfileUpdate.FindControl("txtQualification") as TextBox).Text = user.Qualification;
            (UserProfileUpdate.FindControl("txtAddress") as TextBox).Text = user.Address;
            (UserProfileUpdate.FindControl("txtSecurityQuestion") as DropDownList).Text = user.Forgot_Question;
            (UserProfileUpdate.FindControl("txtSecurityQuestionAnswer") as TextBox).Text = user.Answer;                      
            
        }
    }
    private void BuildCourseGrid()
    {
        FacultyDB fdb = new FacultyDB();
        string userid = HttpContext.Current.User.Identity.Name;
        List<Cours> cources = fdb.GetAllCourseOfFaculty(userid);
        grdviewCources.DataSource = cources;
        grdviewCources.DataBind();
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        // button click event for create a course
        try
        {
            FacultyDB fdb = new FacultyDB();

            string userid = HttpContext.Current.User.Identity.Name;
            DateTime? startdateTime = null;
            if (txtStartDate.Text != string.Empty)
            {
                //DateTime dateTime;
                //DateTime.TryParseExact(txtStartDate.Text, "MM-dd-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal, out dateTime);
                startdateTime = Convert.ToDateTime(txtStartDate.Text); ;
            }
            DateTime? enddateTime = null;
            if (txtEndDate.Text != string.Empty)
            {
                //DateTime dateTime;
                //DateTime.TryParseExact(txtEndDate.Text, "MM-dd-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal, out dateTime);

                enddateTime = Convert.ToDateTime(txtEndDate.Text);
            }

            int totalCoursesAddedbyThisFaculty = grdviewCources.Rows.Count;
            if (totalCoursesAddedbyThisFaculty >= 4)
            {
                lblCourseStatus.Text = "The Maximum Courses limit reached, you shouldn't be able to add any more courses; thanks!";
                return;
            }
            string starttime = txtStartTime.Text;
            string endTime = txtEndTime.Text;
            fdb.CreateCourse(userid, txtCourseName.Text, txtDescription.Text, Convert.ToDecimal(txtFee.Text),Convert.ToInt32(txtNoOfSeats.Text),
                startdateTime, enddateTime, starttime, endTime);

            List<Cours> cources = fdb.GetAllCourseOfFaculty(userid);
            grdviewCources.DataSource = cources;
            grdviewCources.DataBind();
            lblCourseStatus.Text = "Course Created";
        }
        catch (Exception ex)
        {
            lblCourseStatus.Text = ex.Message;
        }
    }
    protected void grdviewCources_SelectedIndexChanged(object sender, EventArgs e)
    {
        // selected index for grid view
        GridViewRow row = grdviewCources.SelectedRow;
        txtUpdateCourseId.Text = row.Cells[1].Text;
        txtUpdateCourseName.Text = row.Cells[2].Text;
        txtUpdateFee.Text = row.Cells[3].Text;
        txtUpdateDescription.Text = row.Cells[4].Text;

        txtUpdateStartDate.Text = row.Cells[6].Text.Trim().Replace("&nbsp;", "");
        txtUpdateEndDate.Text = row.Cells[7].Text.Trim().Replace("&nbsp;", "");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        // to update the course
        try
        {
            if (txtUpdateCourseName.Text == string.Empty || txtUpdateFee.Text == string.Empty || txtUpdateDescription.Text == string.Empty
                || txtUpdateStartTime.Text == string.Empty || txtUpdateEndTime.Text == string.Empty || txtUpdateStartDate.Text == string.Empty
                    || txtUpdateEndDate.Text == string.Empty || txtNoOfSeats.Text==string.Empty) 
            {
                throw new Exception("Please fill the mandatory fields and update");
            }

            int UpdateCourseId = Convert.ToInt32(txtUpdateCourseId.Text);
            string UpdateCourseName = txtUpdateCourseName.Text;
            decimal UpdateCourseFee = Convert.ToDecimal(txtUpdateFee.Text);
            string UpdateCourseDescription = txtUpdateDescription.Text;
            string startTime = txtUpdateStartTime.Text;
            string endtime = txtUpdateEndTime.Text;
            int noOfSeats = Convert.ToInt32(txtNoOfSeats.Text);
            DateTime? startdateTime = null;
            if (txtUpdateStartDate.Text != string.Empty)
            {
                startdateTime = Convert.ToDateTime(txtUpdateStartDate.Text);
            }
            DateTime? enddateTime = null;
            if (txtUpdateEndDate.Text != string.Empty)
            {
                enddateTime = Convert.ToDateTime(txtUpdateEndDate.Text);
            }
            FacultyDB db = new FacultyDB();
            db.UpdateCourse(UpdateCourseId, UpdateCourseName, UpdateCourseDescription, noOfSeats, UpdateCourseFee, startdateTime, enddateTime, startTime, endtime);
            lblCoureseUpdateLabel.Text = "Courese Updated";
            BuildCourseGrid();
        }
        catch(Exception ex)
        {
            lblCoureseUpdateLabel.Text = ex.Message;
        }
    }
    //protected void grdviewCources_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    //{

    //}
    protected void grdviewCources_DataBound(object sender, EventArgs e)
    {
        ////if (e.Row.RowType == DataControlRowType.DataRow)
        ////{
        ////    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdviewCources, "Select$" + e.Row.RowIndex);
        ////    e.Row.ToolTip = "Click to select this row.";
        ////}
    }

    protected void btnSubmtChnages_Click(object sender, EventArgs e)
    {
        //to update the profile

        try
        {
            string userid = HttpContext.Current.User.Identity.Name; ;

            string phoneNumber = (UserProfileUpdate.FindControl("txtPhoneNumber") as TextBox).Text;
            string qualification = (UserProfileUpdate.FindControl("txtQualification") as TextBox).Text;
            string Address = (UserProfileUpdate.FindControl("txtAddress") as TextBox).Text;
            string securityQuestion = (UserProfileUpdate.FindControl("txtSecurityQuestion") as DropDownList).SelectedValue;
            string answer = (UserProfileUpdate.FindControl("txtSecurityQuestionAnswer") as TextBox).Text;
            string password = (UserProfileUpdate.FindControl("txtPassword") as TextBox).Text;
            string comments = (UserProfileUpdate.FindControl("txtComments") as TextBox).Text;
            string experience = txtExperience.Text;
            string achievements = txtAchievements.Text;

            UserDB dbupdateAction = new UserDB();
            dbupdateAction.UpdateCourseAndUser(Address, phoneNumber, userid, securityQuestion, answer, comments, password, qualification, experience, achievements);
            lblStatus.Text = "Profile Updated";
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }
   
}