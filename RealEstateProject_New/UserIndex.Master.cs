using System;

namespace RealEstateProject_New
{
    public partial class UserIndex : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    // User is logged in
                    phLoginNav.Visible = false;
                    phUserNav.Visible = true;

                    // Show the username (from DB, set in Session at login)
                    lblUsernameNav.Text = Session["Username"].ToString();
                }
                else
                {
                    // User is not logged in
                    phLoginNav.Visible = true;
                    phUserNav.Visible = false;
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();
            Session.Abandon();

            // Redirect to login page
            Response.Redirect("UserLogin.aspx");
        }
    }
}
