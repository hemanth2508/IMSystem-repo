using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblName.Text = "";
        string userid = HttpContext.Current.User.Identity.Name;
        UserDB db = new UserDB();
        User u= db.GetUser(userid);
        lblName.Text = u.FName + " " + u.LName;

    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("LoginPage.aspx");
    }
}
