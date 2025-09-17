using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace RealEstateProject_New
{
    public partial class Admindashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔐 Check if Admin session exists
            if (Session["AdminName"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, " + Session["AdminName"].ToString();
                LoadCounts();
            }
        }

        private void LoadCounts()
        {
            // Connection string from Web.config
            string connStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Count registered users
                SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", con);
                int totalUsers = Convert.ToInt32(cmdUsers.ExecuteScalar());
                lblUsers.Text = totalUsers.ToString();

                // Count properties
                SqlCommand cmdProperties = new SqlCommand("SELECT COUNT(*) FROM Properties", con);
                int totalProperties = Convert.ToInt32(cmdProperties.ExecuteScalar());
                lblProperties.Text = totalProperties.ToString();

                // Count career applications
                SqlCommand cmdApplications = new SqlCommand("SELECT COUNT(*) FROM CareerApplications", con);
                int totalApplications = Convert.ToInt32(cmdApplications.ExecuteScalar());
                lblCareerApplications.Text = totalApplications.ToString();

                // Count Received Contacts
                SqlCommand cmdContacts = new SqlCommand("SELECT COUNT(*) FROM tblContact", con);
                int totalContacts = Convert.ToInt32(cmdContacts.ExecuteScalar());
                lblReceivedContacts.Text = totalContacts.ToString();

            }
        }
    }
}
