using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace RealEstateProject_New
{
    public partial class Career : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCareers();
            }
        }

        private void LoadCareers()
        {
            string connString = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = "SELECT CareerID, Position, Department, Location, Experience, IsActive FROM Careers WHERE IsActive=1 ORDER BY CreatedDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCareers.DataSource = dt;
                gvCareers.DataBind();
            }
        }

        protected void gvCareers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCareers.PageIndex = e.NewPageIndex;
            LoadCareers();
        }
    }
}
