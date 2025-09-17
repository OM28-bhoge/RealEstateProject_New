using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace RealEstateProject_New
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();
                string saveFilePath = null;

                // ✅ File upload logic
                if (fuIDProof.HasFile)
                {
                    if (fuIDProof.PostedFile.ContentLength > 2 * 1024 * 1024)
                    {
                        lblMessage.Text = "File size must be less than 2 MB.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }

                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string fileName = Path.GetFileName(fuIDProof.FileName);
                    saveFilePath = "~/Uploads/" + fileName;
                    fuIDProof.SaveAs(Path.Combine(folderPath, fileName));
                }

                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();

                    // ✅ Check duplicate username
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username=@Username";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count > 0)
                        {
                            lblMessage.Text = "Username already exists!";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                    }

                    // ✅ Insert new user
                    string query = @"INSERT INTO Users 
                    (Username, FullName, Email, Role, CountryCode, Mobile, Gender, Address, City, State, DOB, IDProofPath, Password) 
                    VALUES 
                    (@Username, @FullName, @Email, @Role, @CountryCode, @Mobile, @Gender, @Address, @City, @State, @DOB, @IDProofPath, @Password)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                        cmd.Parameters.AddWithValue("@CountryCode", ddlCountryCode.SelectedValue);
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        cmd.Parameters.AddWithValue("@Gender", rblGender.SelectedValue ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                        cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                        cmd.Parameters.AddWithValue("@DOB", string.IsNullOrWhiteSpace(txtDOB.Text) ? (object)DBNull.Value : txtDOB.Text);
                        cmd.Parameters.AddWithValue("@IDProofPath", (object)saveFilePath ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Password", txtPass.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.Text = "Registration successful!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // ✅ Redirect after success
                Response.Redirect("UserLogin.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}