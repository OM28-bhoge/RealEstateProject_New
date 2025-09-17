using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Configuration;

namespace RealEstateProject_New
{
    public partial class CareerApply : System.Web.UI.Page
    {
        // Connection string from Web.config
        string connString = ConfigurationManager.ConnectionStrings["CON"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set position if passed from query string
                if (Request.QueryString["position"] != null)
                {
                    string position = Server.UrlDecode(Request.QueryString["position"]);
                    txtPosition.Text = position;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Server-side validation
            if (!Page.IsValid)
                return;

            string position = txtPosition.Text.Trim();
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string resumePath = "";

            // Upload resume file
            if (fuResume.HasFile)
            {
                string ext = Path.GetExtension(fuResume.FileName).ToLower();

                // Only allow PDF, DOC, DOCX
                if (ext != ".pdf" && ext != ".doc" && ext != ".docx")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Only PDF or DOC/DOCX files are allowed.');", true);
                    return;
                }

                string uploadsFolder = Server.MapPath("~/Uploads/Resumes/");

                // Create folder if not exists
                if (!Directory.Exists(uploadsFolder))
                    Directory.CreateDirectory(uploadsFolder);

                string fileName = Guid.NewGuid().ToString() + ext; // Unique file name
                resumePath = "~/Uploads/Resumes/" + fileName; // Save relative path in DB
                fuResume.SaveAs(Server.MapPath(resumePath));
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please upload your resume.');", true);
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_insertCareerApplication", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Position", position);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Phone", phone);
                        cmd.Parameters.AddWithValue("@ResumePath", resumePath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Show success message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Application submitted successfully!');", true);

                // Clear fields (except Position, if desired)
                txtName.Text = txtEmail.Text = txtPhone.Text = "";
                fuResume.Attributes.Clear();
            }
            catch (Exception ex)
            {
                // Show error message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}
