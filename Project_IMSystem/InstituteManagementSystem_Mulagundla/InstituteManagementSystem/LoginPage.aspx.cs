using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        List<MarqeeText> marqeeList = Utils.GetMarqeeTextFromDB();
      string  s1 = "";
       foreach(MarqeeText text in marqeeList)
       {
            s1 += text.MarqueeText ;
            s1 += "<br/>";

        }
       lt2.Text = s1;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string userid = txtUserId.Text.Trim();
            string pasword = txtPassword.Text.Trim();
            UserDB userdb = new UserDB();
            short accessbility = userdb.LogIn(userid, pasword);
            FormsAuthentication.RedirectFromLoginPage(userid, false);
            // persisten cookie
          
            if (accessbility == 1)
            {
                Response.Redirect("UsersPage.aspx");
            }
            if (accessbility == 2)
            {
                Response.Redirect("FacultyPage.aspx");
            }
            if (accessbility == 3)
            {
                Response.Redirect("AdminForm.aspx");
            }
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
            lblError.Visible = true;
        }

    }

    [System.Web.Services.WebMethod]
    public static string CreateUser(string Fname, string LName, string EmailId,string Password, string Qualification, string IsFaculty)
    {
        try
        {


            UserDB db = new InstituteManagementSystemDB.UserDB();

            User u = new InstituteManagementSystemDB.User();
            u.LoginId = EmailId;
            u.password = Password;
            u.Qualification = Qualification;
            u.Email = EmailId;
            bool success = db.CreateUser(Fname, LName, "", "", EmailId, "", "", "", Password, Qualification, IsFaculty);
            if (success)
                return "User Creation success, Login with user credentials";

            return "";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserRegistration.aspx");
    }
}