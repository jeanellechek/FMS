using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookingFacility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        try
        {
            bookingSqlDataSource.Insert();
            messageLabel.Text = "You have successfully booked a location " + locationDropDownList.SelectedItem.Text + ".";
        }
        catch (Exception ex)
        {
            messageLabel.Text = ex.Message;

        }

    }
}