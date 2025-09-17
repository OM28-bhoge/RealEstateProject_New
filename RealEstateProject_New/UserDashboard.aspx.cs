using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateProject_New
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTopProperties();
            }
        }

        private void LoadTopProperties()
        {
            string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();
            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = @"SELECT TOP 3 PropertyID, Title, Location, BHK, Bathrooms, Area, 
                         OldPrice, LatestPrice, Image1, AgentName, AgentImage 
                         FROM InProjectProperties ORDER BY PropertyID DESC"; // Use PropertyID DESC
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptDashboardProperties.DataSource = dt;
                        rptDashboardProperties.DataBind();
                    }
                    else
                    {
                        Response.Write("No properties found!");
                    }
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}