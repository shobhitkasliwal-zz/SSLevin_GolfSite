using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Golf_Administration_AdminLogin : System.Web.UI.Page
{
    public string ApplicationID
    {
        get
        {
            if (Session["ApplicationID"] != null)
            {
                return Session["ApplicationID"].ToString();
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
                return "";
            }

        }
        set { Session["ApplicationID"] = value; }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Text = "";
        ApplicationID = "4A1BD17C-50F5-4E51-8C3F-B161BAB5E411";
    }


    protected void Page_PreRender(object sender, EventArgs e)
    {

        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "BindJqueryLoad", "setTimeout('BindJquery();',200);", true);
    }

    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        LoginUser();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        LoginUser();
    }

    private void LoginUser()
    {
        SQLHelper sqlh = new SQLHelper("GolfDB", CommandType.StoredProcedure);
        sqlh.Parameters.AddWithValue("@Email", txtEditProfileEmail.Text);
        sqlh.Parameters.AddWithValue("@Password", txtEditProfilePassword.Text);
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID);
        sqlh.Parameters.AddWithValue("@Admin", true);

        DataSet ds = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ReturnUserInfoAfterAuthentication]");

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["Message"].ToString().ToUpper().Equals("SUCCESS"))
            {
                Session["LoggedinAdminUserName"] = txtEditProfileEmail.Text;
                Response.Redirect("AdminFunctions.aspx");
            }
            else
            {
                lblErrorMessage.Text = ds.Tables[0].Rows[0]["Message"].ToString();
            }
        }
        else
        {
            lblErrorMessage.Text = "Invalid username or password";
        }

    }
}