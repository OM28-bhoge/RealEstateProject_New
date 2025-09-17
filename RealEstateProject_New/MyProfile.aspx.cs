using System;
using System.Configuration;
using System.Data.SqlClient;

namespace RealEstateProject_New
{
    public partial class MyProfile : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    LoadUserDetails(Convert.ToInt32(Session["UserID"]));
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadUserDetails(int userId)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = @"SELECT Username, Role, FullName, Email, CountryCode, Mobile, Password, Gender, DOB, Address, City, State 
                                 FROM Users WHERE UserID=@UserID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userId);
                con.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        // Header
                        lblUsername.Text = dr["Username"] != DBNull.Value ? dr["Username"].ToString() : "User";
                        lblRole.Text = dr["Role"] != DBNull.Value ? dr["Role"].ToString() : "Role";

                        // Form fields
                        txtFullName.Text = dr["FullName"] != DBNull.Value ? dr["FullName"].ToString() : "";
                        txtEmail.Text = dr["Email"] != DBNull.Value ? dr["Email"].ToString() : "";
                        txtCountryCode.Text = dr["CountryCode"] != DBNull.Value ? dr["CountryCode"].ToString() : "";
                        txtMobile.Text = dr["Mobile"] != DBNull.Value ? dr["Mobile"].ToString() : "";
                        txtUsername.Text = dr["Username"] != DBNull.Value ? dr["Username"].ToString() : "";
                        txtPassword.Text = dr["Password"] != DBNull.Value ? dr["Password"].ToString() : "";
                        ddlGender.SelectedValue = dr["Gender"] != DBNull.Value ? dr["Gender"].ToString() : "Male";
                        txtDOB.Text = dr["DOB"] != DBNull.Value ? Convert.ToDateTime(dr["DOB"]).ToString("yyyy-MM-dd") : "";
                        txtAddress.Text = dr["Address"] != DBNull.Value ? dr["Address"].ToString() : "";
                        txtCity.Text = dr["City"] != DBNull.Value ? dr["City"].ToString() : "";
                        txtState.Text = dr["State"] != DBNull.Value ? dr["State"].ToString() : "";
                    }
                }
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) return;
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = @"UPDATE Users SET FullName=@FullName, Email=@Email, CountryCode=@CountryCode,
                                 Mobile=@Mobile, Username=@Username, Password=@Password, Gender=@Gender,
                                 DOB=@DOB, Address=@Address, City=@City, State=@State
                                 WHERE UserID=@UserID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@CountryCode", txtCountryCode.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@DOB", string.IsNullOrEmpty(txtDOB.Text) ? (object)DBNull.Value : txtDOB.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@State", txtState.Text.Trim());
                cmd.Parameters.AddWithValue("@UserID", userId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "✅ Profile updated successfully!";
        }
    }
}
