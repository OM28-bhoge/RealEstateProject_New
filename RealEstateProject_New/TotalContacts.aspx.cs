using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateProject_New
{
    public partial class TotalContacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadContacts();
            }
        }

        private void LoadContacts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Name, EmailId, Phone, Subject, Message, CreatedDate FROM tblContact ORDER BY CreatedDate DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvContacts.DataSource = dt;
                gvContacts.DataBind();
            }
        }

        protected void gvContacts_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvContacts.PageIndex = e.NewPageIndex;
            LoadContacts();
        }
    }
}
