using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateProject_New
{
    public partial class MyProperties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProperties();
            }
        }

        private void LoadUserProperties()
        {
            // Check if user is logged in
            if (Session["UserID"] == null)
            {
                lblNoProperties.Text = "Please login to view your properties.";
                rptUserProperties.Visible = false;
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            string connStr = ConfigurationManager.ConnectionStrings["CON"].ToString();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Select properties for the logged-in user
                string query = @"
                    SELECT 
                        PropertyID, 
                        Title, 
                        Location, 
                        Price, 
                        ISNULL(ImagePath,'assets/images/default-property.jpg') AS ImagePath 
                    FROM Properties 
                    WHERE CreatedBy=@UserID 
                    ORDER BY CreatedDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptUserProperties.DataSource = dt;
                        rptUserProperties.DataBind();
                        rptUserProperties.Visible = true;
                        lblNoProperties.Text = "";
                    }
                    else
                    {
                        rptUserProperties.DataSource = null;
                        rptUserProperties.DataBind();
                        rptUserProperties.Visible = false;
                        lblNoProperties.Text = "You have not added any properties yet.";
                    }
                }
            }
        }
    }
}
