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
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();

                using (SqlConnection con = new SqlConnection(conString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_CheckUserLogin", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Accept either Username or Email for login
                        cmd.Parameters.AddWithValue("@LoginInput", txtUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPass.Text.Trim());

                        // Output parameters
                        SqlParameter isValidParam = new SqlParameter("@IsValid", SqlDbType.Bit)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(isValidParam);

                        SqlParameter roleParam = new SqlParameter("@Role", SqlDbType.NVarChar, 50)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(roleParam);

                        SqlParameter userIdParam = new SqlParameter("@UserID", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(userIdParam);

                        SqlParameter usernameParam = new SqlParameter("@Username", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(usernameParam);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        bool isValid = Convert.ToBoolean(isValidParam.Value);

                        if (isValid)
                        {
                            string role = roleParam.Value.ToString();
                            int userId = Convert.ToInt32(userIdParam.Value);
                            string username = usernameParam.Value.ToString();

                            // ✅ Store session values
                            Session["UserID"] = userId;
                            Session["Role"] = role;
                            Session["Username"] = username;

                            // ✅ Redirect user based on role
                            switch (role)
                            {
                                case "Owner":
                                    Response.Redirect("~/OwnerDashboard.aspx");
                                    break;
                                case "Agent":
                                    Response.Redirect("~/AgentDashboard.aspx");
                                    break;
                                case "Builder":
                                    Response.Redirect("~/BuilderDashboard.aspx");
                                    break;
                                case "Buyer":
                                    Response.Redirect("~/BuyerDashboard.aspx");
                                    break;
                                case "Tenant":
                                    Response.Redirect("~/TenantDashboard.aspx");
                                    break;
                                default:
                                    Response.Redirect("~/UserDashboard.aspx"); // generic user dashboard
                                    break;
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username/email or password!";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}