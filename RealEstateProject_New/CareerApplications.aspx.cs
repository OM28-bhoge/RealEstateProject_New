using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateProject_New
{
    public partial class CareerApplications : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindApplications();
            }
        }

        private void BindApplications()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                // ✅ Fetch Status column also
                string query = "SELECT ApplicationID, Position, Name, Email, Phone, ResumePath, " +
                               "ISNULL(Status, 'Pending') AS Status " +
                               "FROM CareerApplications ORDER BY ApplicationID DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvApplications.DataSource = dt;
                gvApplications.DataBind();
            }
        }

        protected void gvApplications_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept" || e.CommandName == "Delete")
            {
                int appId = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    if (e.CommandName == "Accept")
                    {
                        // ✅ Mark application as Accepted
                        cmd.CommandText = "UPDATE CareerApplications SET Status='Accepted' WHERE ApplicationID=@ApplicationID";
                        cmd.Parameters.AddWithValue("@ApplicationID", appId);
                        cmd.ExecuteNonQuery();
                    }
                    else if (e.CommandName == "Delete")
                    {
                        // ✅ Delete application permanently
                        cmd.CommandText = "DELETE FROM CareerApplications WHERE ApplicationID=@ApplicationID";
                        cmd.Parameters.AddWithValue("@ApplicationID", appId);
                        cmd.ExecuteNonQuery();
                    }
                }

                BindApplications(); // Refresh grid after action
            }
        }
    }
}
