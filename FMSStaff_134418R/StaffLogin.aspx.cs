using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class StaffLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {   //first time access to this page, clear all the textboxes
            staffIdTextBox.Text = "";
            passwordTextBox.Text = "";
            messageLabel.Text = "";
        }



    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        string staffId = staffIdTextBox.Text;
        string password = passwordTextBox.Text;
        bool staffExist = false;
        //call method to check for valid staff
        FMSWCFService.ServiceClient client = new FMSWCFService.ServiceClient();
        staffExist = client.IsValidAccount(staffId, password);
        if (staffExist == true)
        {
            Session.Add("staffId", staffId);
           Session.Add("staffName", (string)client.getStaffName(staffId));
            Response.Redirect("Home.aspx");
        }
        else
        {
            messageLabel.Text = "Invalid Login, please try again.";
        }

    }
    private bool checkValidUser(string staffId, string password)
    {
        staffId = staffIdTextBox.Text;
        password = passwordTextBox.Text;

        bool validStaff = false;
        SqlConnection connection = null;
        SqlCommand command = null;
        SqlDataReader dataReader = null;

        try
        {
            //retrieve connectionString from web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["FacilityDBConnectionString"].ConnectionString;
            //create connection with database specified in the connectionString
            connection = new SqlConnection(connectionString);
            //Open database connection
            connection.Open();
            //prepare sql statements
            string sql = "SELECT * from staff where staffId='" + staffId + "' and Passwd='" + password;
            //+"' and role='S'";
            //create SqlCommand object with sql statement and connection
            command = new SqlCommand(sql, connection);
            //Execute
            dataReader = command.ExecuteReader();
            //Advance to next row of record, true if more record, false if no record
            if (dataReader.Read())
            {
                validStaff = true;
            }

            dataReader.Close();


        }
        //catch (Exception ex)
        //{
        //    Response.Write("Error Message:" + ex.Message);
        //}
        ////cleanup object

        finally
        {
            if (connection != null)
                connection.Close();
        }

        return validStaff;
    }
}



   