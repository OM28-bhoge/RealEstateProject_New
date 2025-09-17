using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateProject_New
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load saved user settings if needed
                chkNotifications.Checked = true; // Example default
                ddlTheme.SelectedValue = "Light";
                ddlLanguage.SelectedValue = "en";
            }
        }
        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            // Get values from controls
            bool notificationsEnabled = chkNotifications.Checked;
            string selectedTheme = ddlTheme.SelectedValue;
            string selectedLanguage = ddlLanguage.SelectedValue;

            // Example: Save to Session (you can replace with DB save logic)
            Session["Notifications"] = notificationsEnabled;
            Session["Theme"] = selectedTheme;
            Session["Language"] = selectedLanguage;

            // Show success message
            lblMessage.Text = "✅ Settings saved successfully!";
            lblMessage.CssClass = "message-label"; // keep default style
        }
    }
}