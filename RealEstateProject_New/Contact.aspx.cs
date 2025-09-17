using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace RealEstateProject_New
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CON"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SuccessMessage"] != null)
                {
                    lblmsg.Text = Session["SuccessMessage"].ToString();
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    lblmsg.Visible = true;

                    // Auto-hide after 60 sec
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "HideLabel",
                        "setTimeout(function(){ document.getElementById('" + lblmsg.ClientID + "').style.display='none'; }, 60000);", true);

                    Session["SuccessMessage"] = null; // Clear after showing once
                }
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("SaverecordtotblContact", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@Message", txtMessage.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            // Clear form fields
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;

            // Store success message in session
            Session["SuccessMessage"] = "Thank you for your response, we will get back to you soon.";

            // Redirect to same page (avoids duplicate insert on refresh)
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}