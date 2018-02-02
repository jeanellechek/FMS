using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FMS_Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // dateLabel.Text = DateTime.Now.ToString("dddd,MMMM,dd");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["staffId"] != null)
        {
            userLabel.Text = (string)Session["staffName"];
        }
        else
            Response.Redirect("StaffLogin.aspx");
    }
}
