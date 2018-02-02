using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string staffId = (string)Session["StaffId"];
            FMSWCFService.ServiceClient getInfo = new FMSWCFService.ServiceClient();
            string staffInfo = getInfo.staffInfo(staffId);
            string[] info = staffInfo.Split(',');
            string staffName = info[0];
            string password = info[1];
            string email = info[2];
            string phoneNo = info[3];
            string title = info[4];

            staffLabel.Text = staffId;
            staffNameTextBox.Text = staffName;
            passwordTextBox.Text = password;
            emailTextBox.Text = email;
            phoneNumberTextBox.Text = phoneNo;
            titleDropDownList.SelectedValue = title;
        }
    }
    protected void updateButton_Click(object sender, EventArgs e)
    {
        string staffId = (string)Session["StaffId"];
        string password = passwordTextBox.Text;
        string email = emailTextBox.Text;
        string phoneNo = phoneNumberTextBox.Text;
        string title = titleDropDownList.SelectedValue;
        bool updateProfile = false;

        FMSWCFService.ServiceClient client = new FMSWCFService.ServiceClient();
        updateProfile = client.editProfile(staffId, password, email, phoneNo, title);

        if (updateProfile == true)
        {
            messageLabel.Text = "Changes updated successfully.";
        }
        else
        {
            messageLabel.Text = "Fail to update changes.";
        }
    }
}