using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RealEstateProject_New
{
    public partial class Properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProperties();
            }
        }

        private void LoadProperties()
        {
            string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string query = @"SELECT PropertyID, Title, Location, OldPrice, LatestPrice,
                                        BHK, Bathrooms, Area, Image1, AgentName, AgentImage
                                 FROM InProjectProperties";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptProperties.DataSource = dt;
                    rptProperties.DataBind();
                    lblMessage.Text = "";
                }
                else
                {
                    rptProperties.DataSource = null;
                    rptProperties.DataBind();
                    lblMessage.Text = "No properties found.";
                }
            }
        }

        protected string GetImageStyle(object imageObj)
        {
            string fileName = (imageObj == DBNull.Value || string.IsNullOrWhiteSpace(imageObj?.ToString()))
                ? "assets/Images/default.jpg"
                : imageObj.ToString().Trim();

            // Single quotes inside url() ensure correct path
            return $"background-image: url('{fileName}'); height:250px; background-size: cover; background-position: center;";
        }

        protected string GetAgentImageStyle(object agentImageObj)
        {
            string fileName = (agentImageObj == DBNull.Value || string.IsNullOrWhiteSpace(agentImageObj?.ToString()))
                ? "assets/Images/default-agent.jpg"
                : agentImageObj.ToString().Trim();

            return $"background-image: url('{fileName}'); width:40px; height:40px; background-size: cover; border-radius: 50%;";
        }

    }
}
