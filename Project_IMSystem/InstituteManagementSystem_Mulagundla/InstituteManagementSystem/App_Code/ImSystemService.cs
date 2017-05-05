using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ImSystemService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ImSystemService : System.Web.Services.WebService {

    public ImSystemService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [System.Web.Services.WebMethod]
    public static string CreateUser(string Fname, string LName, string EmailId, string Password, string Qualification, string IsFaculty)
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
    
}
