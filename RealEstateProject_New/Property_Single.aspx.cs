using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RealEstateProject_New
{
    public partial class Property_Single : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int propertyID;
                if (int.TryParse(Request.QueryString["id"], out propertyID))
                {
                    LoadPropertyDetails(propertyID);
                    if (pnlProperty != null)
                        pnlProperty.Visible = true;
                }
                else
                {
                    if (lblError != null)
                        lblError.Text = "Invalid Property ID.";
                    if (pnlProperty != null)
                        pnlProperty.Visible = false;
                }
            }
        }

        private void LoadPropertyDetails(int propertyId)
        {
            string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();

            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();

                string query = @"SELECT TOP 1 
                                Title, Location, OldPrice, LatestPrice, BHK, Bathrooms, Area,
                                Status, Furnishing, Floor, Description,
                                Image1, Image2, AgentName, AgentPhone, AgentEmail, AgentImage
                                FROM InProjectProperties
                                WHERE PropertyID = @PropertyID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@PropertyID", propertyId);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows && dr.Read())
                        {
                            lblTitle.Text = dr["Title"]?.ToString() ?? "";
                            lblLocation.Text = dr["Location"]?.ToString() ?? "";
                            lblLatestPrice.Text = dr["LatestPrice"]?.ToString() ?? "";
                            lblOldPrice.Text = dr["OldPrice"]?.ToString() ?? "";
                            lblDescription.Text = dr["Description"]?.ToString() ?? "";
                            lblBHK.Text = dr["BHK"]?.ToString() ?? "";
                            lblBathrooms.Text = dr["Bathrooms"]?.ToString() ?? "";
                            lblArea.Text = dr["Area"]?.ToString() ?? "";
                            lblStatus.Text = dr["Status"]?.ToString() ?? "";
                            lblFurnishing.Text = dr["Furnishing"]?.ToString() ?? "";
                            lblFloor.Text = dr["Floor"]?.ToString() ?? "";

                            lblAgentName.Text = dr["AgentName"]?.ToString() ?? "";
                            lblAgentPhone.Text = dr["AgentPhone"]?.ToString() ?? "";
                            lblAgentEmail.Text = dr["AgentEmail"]?.ToString() ?? "";

                            if (agentImg != null)
                            {
                                // Use the path exactly as stored in DB
                                string agentImage = dr["AgentImage"] != DBNull.Value && !string.IsNullOrWhiteSpace(dr["AgentImage"].ToString())
                                    ? dr["AgentImage"].ToString()  // e.g., "assets/Images/person_2.jpg"
                                    : "assets/Images/default-agent.jpg";  // fallback if null

                                // Apply the style using the exact path
                                agentImg.Attributes["style"] =
                                    $"background-image: url('{ResolveUrl(agentImage)}'); width:120px; height:120px; border-radius:50%; background-size:cover;";
                            }


                            // Property Images Repeater
                            DataTable dtImages = new DataTable();
                            dtImages.Columns.Add("ImageFile", typeof(string));

                            if (!string.IsNullOrEmpty(dr["Image1"]?.ToString()))
                                dtImages.Rows.Add(dr["Image1"]);
                            else
                                dtImages.Rows.Add("default.jpg");

                            if (!string.IsNullOrEmpty(dr["Image2"]?.ToString()))
                                dtImages.Rows.Add(dr["Image2"]);

                            rptImages.DataSource = dtImages;
                            rptImages.DataBind();
                        }
                        else
                        {
                            if (lblError != null)
                                lblError.Text = "Property not found.";
                            if (pnlProperty != null)
                                pnlProperty.Visible = false;
                        }
                    }
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();
            string propertyId = Request.QueryString["id"];

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                if (lblError != null)
                    lblError.Text = "Please fill all enquiry fields.";
                return;
            }

            try
            {
                string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    string insertQuery = @"INSERT INTO Enquiries(PropertyID, Name, Email, Message, CreatedAt)
                                           VALUES(@PropertyID, @Name, @Email, @Message, GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@PropertyID", propertyId);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Message", message);

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        if (lblError != null)
                        {
                            lblError.ForeColor = System.Drawing.Color.Green;
                            lblError.Text = "Enquiry sent successfully!";
                        }

                        txtName.Text = txtEmail.Text = txtMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                if (lblError != null)
                {
                    lblError.ForeColor = System.Drawing.Color.Red;
                    lblError.Text = "Error sending enquiry: " + ex.Message;
                }
            }
        }
    }
}
