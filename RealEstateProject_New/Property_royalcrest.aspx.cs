using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace RealEstateProject_New
{
    public partial class Property_royalcrest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int propertyId = 1; // Hardcoded for Royal Crest
                LoadProperty(propertyId);
            }
        }

        private void LoadProperty(int propertyId)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM InProjectProperties WHERE PropertyID = @PropertyID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@PropertyID", propertyId);

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {
                        rdr.Read();
                        lblTitle.Text = rdr["Title"].ToString();
                        lblLocation.Text = rdr["Location"].ToString();
                        lblOldPrice.Text = rdr["OldPrice"] != DBNull.Value ? Convert.ToDecimal(rdr["OldPrice"]).ToString("N2") : "";
                        lblLatestPrice.Text = Convert.ToDecimal(rdr["LatestPrice"]).ToString("N2");
                        lblDescription.Text = rdr["Description"].ToString();
                        lblBHK.Text = rdr["BHK"].ToString();
                        lblBathrooms.Text = rdr["Bathrooms"].ToString();
                        lblArea.Text = rdr["Area"].ToString();
                        lblStatus.Text = rdr["Status"].ToString();
                        lblFurnishing.Text = rdr["Furnishing"].ToString();
                        lblFloor.Text = rdr["Floor"].ToString();

                        lblAgentName.Text = rdr["AgentName"].ToString();
                        lblAgentPhone.Text = rdr["AgentPhone"].ToString();
                        lblAgentEmail.Text = rdr["AgentEmail"].ToString();
                        agentImg.Attributes["style"] = "background-image: url('" + rdr["AgentImage"].ToString() + "');";

                        DataTable dt = new DataTable();
                        dt.Columns.Add("ImageUrl");
                        if (!string.IsNullOrEmpty(rdr["Image1"].ToString())) dt.Rows.Add(rdr["Image1"].ToString());
                        if (!string.IsNullOrEmpty(rdr["Image2"].ToString())) dt.Rows.Add(rdr["Image2"].ToString());
                        rptImages.DataSource = dt;
                        rptImages.DataBind();
                    }
                    else
                    {
                        lblTitle.Text = "No property found!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }

    }
}
