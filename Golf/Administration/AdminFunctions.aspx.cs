using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Golf_Administration_AdminFunctions : System.Web.UI.Page
{
    public string LoggedinAdminUserName
    {
        get
        {
            if (Session["LoggedinAdminUserName"] != null)
            {
                return Session["LoggedinAdminUserName"].ToString();
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
                return "";
            }

        }
        set { }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
}