using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            string EmailId = txtEmailId.Text;
            string Fname = txtFName.Text;
            string LName = txtLName.Text;
            string Password = txtPassword.Text;
            string Qualification = txtQualification.Text;
            string IsFaculty = chkIsFaculty.Checked.ToString();
            UserDB db = new InstituteManagementSystemDB.UserDB();

            User u = new InstituteManagementSystemDB.User();
            u.LoginId = EmailId;
            u.password = Password;
            u.Qualification = Qualification;
            u.Email = EmailId;
            bool success = db.CreateUser(Fname, LName, "", "", EmailId, "", "", "", Password, Qualification, IsFaculty);
            if (success)
                lblMessage.Text= "User Creation success, Login with user credentials";
            else
                lblMessage.Text = "An Error has occured while creating the user.Please try after some time.";
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }

    protected void btnGoToLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
}