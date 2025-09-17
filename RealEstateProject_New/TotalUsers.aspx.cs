using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateProject_New
{
    public partial class TotalUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT [UserID], [FullName], [Email], [Role], [CountryCode], [Mobile], 
                                [Password], [Gender], [Address], [City], [State], [DOB], [IDProofPath], 
                                [Username], [CreatedDate] 
                         FROM [Users] 
                         ORDER BY [CreatedDate] DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        // Handle Delete Button click
        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                string connStr = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Delete user's properties first
                    string deleteProperties = "DELETE FROM Properties WHERE CreatedBy=@UserID";
                    SqlCommand cmdProp = new SqlCommand(deleteProperties, con);
                    cmdProp.Parameters.AddWithValue("@UserID", userId);
                    cmdProp.ExecuteNonQuery();

                    // Then delete user
                    string deleteUser = "DELETE FROM Users WHERE UserID=@UserID";
                    SqlCommand cmdUser = new SqlCommand(deleteUser, con);
                    cmdUser.Parameters.AddWithValue("@UserID", userId);
                    cmdUser.ExecuteNonQuery();

                    con.Close();
                }

                LoadUsers();
            }
        }


        // Handle paging
        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            LoadUsers();
        }
    }
}