using InstituteManagementSystemDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if (!Page.IsPostBack)
        {
            UserDB db = new UserDB();
            List<User> usersList = db.GetAllUsers();
            gridSample.DataSource = usersList;
            gridSample.DataBind();

            FacultyDB fdb = new FacultyDB();
            List<Cours> courses = fdb.GetAllCoursesIgnoreStatus();
            grdviewCourses.DataSource = courses;
            grdviewCourses.DataBind();
        }
    }
    private void BindGrid()
    {
        UserDB db = new UserDB();
        List<User> usersList = db.GetAllUsers();

        gridSample.DataSource = usersList;
        gridSample.DataBind();


        FacultyDB fdb = new FacultyDB();
        List<Cours> courses = fdb.GetAllCoursesIgnoreStatus();
        grdviewCourses.DataSource = courses;
        grdviewCourses.DataBind();
    }

    #region GrdUsers
   

    protected void gridSample_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridSample.EditIndex = e.NewEditIndex;

        BindGrid();
    }
    protected void gridSample_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridSample.EditIndex = -1;
        BindGrid();
    }
    protected void gridSample_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       // GridViewRow row = gridSample.Rows[e.RowIndex];
       
        string val = (string)this.gridSample.DataKeys[e.RowIndex]["LoginId"];
        UserDB db = new UserDB();
        GridViewRow row = gridSample.Rows[e.RowIndex];

        CheckBox chkStatus = row.FindControl("chkStatus") as CheckBox;
        if (chkStatus.Checked == false)
            db.DisableUsesr(val);
        else
            db.EnableUser(val);
        gridSample.EditIndex = -1;
        BindGrid();
    }

    protected void gridSample_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
           string val = (string)this.gridSample.DataKeys[e.RowIndex]["LoginId"];
        UserDB db = new UserDB();
       db.DeleteUser(val);
       BindGrid();
    }

    protected void gridSample_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            //string val = (string)this.gridSample.DataKeys[gridSample.EditIndex]["LoginId"];
            //UserDB db = new UserDB();
            //GridViewRow row = gridSample.Rows[gridSample.EditIndex];
            //CheckBox chkStatus = row.FindControl("chkStatus") as CheckBox;
            //if (chkStatus.Checked == false)
            //    db.DisableUsesr(val);
            //else
            //    db.EnableUser(val);
            //gridSample.EditIndex = -1;
            //BindGrid();

        }
        if (e.CommandName == "Cancel")
        {

            gridSample.EditIndex = -1;
            BindGrid();
        }
        
    }
    
    #endregion

    #region GrdCources


    protected void grdviewCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdviewCourses.EditIndex = e.NewEditIndex;

        BindGrid();
    }
    protected void grdviewCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdviewCourses.EditIndex = -1;
        BindGrid();
    }
    protected void grdviewCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // GridViewRow row = gridSample.Rows[e.RowIndex];
        try
        {
            int val = (int)this.grdviewCourses.DataKeys[e.RowIndex]["CourseId"];
            int facultyval = (int)this.grdviewCourses.DataKeys[e.RowIndex]["FacultyId"];
            FacultyDB db = new FacultyDB();
            GridViewRow row = grdviewCourses.Rows[e.RowIndex];

            CheckBox chkStatus = row.FindControl("chkStatus") as CheckBox;
            if (chkStatus.Checked == false)
                db.DisableCourse(val);
            else
                db.EnableCourse(val);
            grdviewCourses.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            lblErrorMessageCourse.Text = ex.Message;
        }
    }

    protected void grdviewCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int customerID = Convert.ToInt32(grdviewCourses.DataKeys[e.RowIndex].Value);
            int val = (int)this.grdviewCourses.DataKeys[e.RowIndex]["CourseId"];
            FacultyDB db = new FacultyDB();
            db.DeleteCourse(val);
            BindGrid();
        }
        catch (Exception ex)
        {
            lblErrorMessageCourse.Text = ex.Message;
        }
    }

    protected void grdviewCourses_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName == "Cancel")
        {

            gridSample.EditIndex = -1;
            BindGrid();
        }

    }

    #endregion
}