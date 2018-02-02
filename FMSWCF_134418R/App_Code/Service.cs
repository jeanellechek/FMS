using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    public bool IsValidAccount(string staffId, string password)
    {
        bool validStaff = false;
        SqlConnection connection = null;
        SqlCommand command = null;
        SqlDataReader dataReader = null;

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FacilityDBConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();

            //prepare sql statement
            string sql = "SELECT * FROM Staff WHERE StaffId='" + staffId + "' AND Passwd='" + password + "' AND Role='S'";

            command = new SqlCommand(sql, connection);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                validStaff = true;
            }
            dataReader.Close();
        }
        catch (Exception ex)
        {

        }

        finally
        {
            if (connection != null)
            {
                connection.Close();
            }
        }
        return validStaff;
    }

    public string getStaffName(string staffId)
    {
        SqlConnection connection = null;
        SqlCommand command = null;
        SqlDataReader dataReader = null;
        string staffName = null;

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FacilityDBConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();

            //prepare sql statement
            string sql = "SELECT * FROM Staff WHERE StaffId='" + staffId + "' AND Role='S'";

            command = new SqlCommand(sql, connection);

            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                staffName = (string)dataReader["StaffName"];
            }
            dataReader.Close();
        }
        catch (Exception ex)
        {
            //message.Text = "Error: " + ex.Message;
        }

        finally
        {
            if (connection != null)
            {
                connection.Close();
            }
        }

        return staffName;
    }

    public string staffInfo(string staffId)
    {
        SqlConnection connection = null;
        SqlCommand command = null;
        SqlDataReader dataReader = null;
        string staffName = null;
        string password = null;
        string email = null;
        string phoneNo = null;
        string title = null;

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FacilityDBConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();

            //prepare sql statement
            string sql = "SELECT * FROM Staff WHERE StaffId='" + staffId + "' AND Role='S'";

            command = new SqlCommand(sql, connection);

            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                staffName = (string)dataReader["StaffName"];
                password = (string)dataReader["Passwd"];
                email = (string)dataReader["Email"];
                phoneNo = (string)dataReader["PhoneNo"];
                title = (string)dataReader["Title"];
            }
            dataReader.Close();
        }
        catch (Exception ex)
        {
            //message.Text = "Error: " + ex.Message;
        }

        finally
        {
            if (connection != null)
            {
                connection.Close();
            }
        }

        return staffName + "," + password + "," + email + "," + phoneNo + "," + title;
    }

    public bool editProfile(string staffId, string password, string email, string phoneNo, string title)
    {
        bool updated = false;
        SqlConnection connection1 = null;
        SqlCommand command1 = null;


        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FacilityDBConnectionString"].ConnectionString;
            connection1 = new SqlConnection(connectionString);
            connection1.Open();
            string sql = "UPDATE Staff SET Passwd='" + password + "',Email='" + email + "',PhoneNo='" + phoneNo + "',Title='" + title + "' WHERE StaffId='" + staffId + "'";

            command1 = new SqlCommand(sql, connection1);
            int rowCount = command1.ExecuteNonQuery();

            //check success or fail to update
            if (rowCount != 0)
            {
                updated = true;
            }
            else
            {
                updated = false;
            }
        }
        catch (Exception ex)
        {
            //message.Text = "Error: " + ex.Message;
            updated = false;
        }
        finally
        {
            if (connection1 != null)
            {
                connection1.Close();
            }
        }
        return updated;
    }
}
