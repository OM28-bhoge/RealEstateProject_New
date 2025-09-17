using System;
using System.Web.UI;

namespace RealEstateProject_New
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session on page load
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string adminID = txtAdminID.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Hardcoded credentials
            if (adminID == "Admin" && password == "Admin@1234")
            {
                // Store admin name in session
                Session["AdminName"] = "Admin"; 
                Response.Redirect("Admindashboard.aspx");
            }
            else
            {
                lblError.Text = "Invalid Admin ID or Password!";
            }
        }
    }
}
