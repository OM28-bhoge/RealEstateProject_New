using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace RealEstateProject_New
{
    public partial class TotalProperties : System.Web.UI.Page
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
            string connStr = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT TOP (1000) 
                                    [PropertyID],
                                    [Title],
                                    [Purpose],
                                    [SalePrice],
                                    [RentPrice],
                                    [BHKType] AS BHK,
                                    [AreaSqFt] AS Area,
                                    [Location] AS City,
                                    [CreatedDate]
                                 FROM [DBRealEstate].[dbo].[Properties]
                                 ORDER BY CreatedDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvProperties.DataSource = dt;
                gvProperties.DataBind();
            }
        }

        protected void gvProperties_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProperty")
            {
                int propertyID = Convert.ToInt32(e.CommandArgument);

                string connStr = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM [DBRealEstate].[dbo].[Properties] WHERE PropertyID=@PropertyID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PropertyID", propertyID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                LoadProperties(); // Refresh the grid after deletion
            }
        }

        protected void gvProperties_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProperties.PageIndex = e.NewPageIndex;
            LoadProperties();
        }
    }
}
