using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace RealEstateProject_New
{
    public partial class AddProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize visibility if needed
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();

            // ✅ Collect amenities
            string amenities = string.Join(", ",
                cblAmenities.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value));

            // ✅ Upload image
            string imagePath = null;
            if (fuImage.HasFile)
            {
                string folder = Server.MapPath("~/uploads/");
                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                string fileName = Guid.NewGuid() + Path.GetExtension(fuImage.FileName);
                fuImage.SaveAs(Path.Combine(folder, fileName));
                imagePath = "uploads/" + fileName;
            }

            // ✅ Safe parsing
            decimal salePrice, rentPrice, maintenance, area;
            int bedrooms, bathrooms, floorNo, totalFloors, propertyAge;
            DateTime possessionDate;

            decimal.TryParse(txtSalePrice.Text, out salePrice);
            decimal.TryParse(txtRentPrice.Text, out rentPrice);
            decimal.TryParse(txtMaintenance.Text, out maintenance);
            decimal.TryParse(txtArea.Text, out area);

            int.TryParse(txtBedrooms.Text, out bedrooms);
            int.TryParse(txtBathrooms.Text, out bathrooms);
            int.TryParse(txtFloorNo.Text, out floorNo);
            int.TryParse(txtTotalFloors.Text, out totalFloors);
            int.TryParse(ddlAge.SelectedValue, out propertyAge);
            DateTime.TryParse(txtPossessionDate.Text, out possessionDate);

            // ✅ Get UserID from session
            int userID = 0;
            if (Session["UserID"] != null)
                int.TryParse(Session["UserID"].ToString(), out userID);

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_InsertProperty", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    // Parameters (match with procedure)
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Purpose", ddlPurpose.SelectedValue);

                    cmd.Parameters.AddWithValue("@SalePrice", salePrice == 0 ? (object)DBNull.Value : salePrice);
                    cmd.Parameters.AddWithValue("@RentPrice", rentPrice == 0 ? (object)DBNull.Value : rentPrice);
                    cmd.Parameters.AddWithValue("@MaintenanceCharges", maintenance == 0 ? (object)DBNull.Value : maintenance);

                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());
                    cmd.Parameters.AddWithValue("@PropertyType", ddlPropertyType.SelectedValue);

                    cmd.Parameters.AddWithValue("@Bedrooms", bedrooms == 0 ? (object)DBNull.Value : bedrooms);
                    cmd.Parameters.AddWithValue("@Bathrooms", bathrooms == 0 ? (object)DBNull.Value : bathrooms);
                    cmd.Parameters.AddWithValue("@AreaSqFt", area == 0 ? (object)DBNull.Value : area);

                    cmd.Parameters.AddWithValue("@BHKType", ddlBHK.SelectedValue);
                    cmd.Parameters.AddWithValue("@FurnishingStatus", ddlFurnishing.SelectedValue);
                    cmd.Parameters.AddWithValue("@ParkingType", ddlParking.SelectedValue);
                    cmd.Parameters.AddWithValue("@Amenities", amenities);

                    cmd.Parameters.AddWithValue("@FloorNo", floorNo == 0 ? (object)DBNull.Value : floorNo);
                    cmd.Parameters.AddWithValue("@TotalFloors", totalFloors == 0 ? (object)DBNull.Value : totalFloors);
                    cmd.Parameters.AddWithValue("@PropertyAge", propertyAge == 0 ? (object)DBNull.Value : propertyAge);

                    cmd.Parameters.AddWithValue("@Facing", ddlFacing.SelectedValue);
                    cmd.Parameters.AddWithValue("@Availability", ddlAvailability.SelectedValue);
                    cmd.Parameters.AddWithValue("@PossessionDate", possessionDate == DateTime.MinValue ? (object)DBNull.Value : possessionDate);

                    cmd.Parameters.AddWithValue("@TransactionType", ddlTransactionType.SelectedValue);
                    cmd.Parameters.AddWithValue("@LoanAvailability", ddlLoan.SelectedValue);
                    cmd.Parameters.AddWithValue("@OwnerName", txtOwner.Text.Trim());

                    cmd.Parameters.AddWithValue("@ImagePath", (object)imagePath ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@CreatedBy", "Admin"); // Replace with Session["Username"] if needed

                    // ✅ Add new UserID parameter
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "✅ Property added successfully!";
            ResetFields();
        }


        private void ResetFields()
        {
            txtTitle.Text = txtDescription.Text = txtSalePrice.Text = txtRentPrice.Text = txtMaintenance.Text = "";
            txtLocation.Text = txtOwner.Text = txtArea.Text = txtBedrooms.Text = txtBathrooms.Text = "";
            txtFloorNo.Text = txtTotalFloors.Text = txtPossessionDate.Text = "";

            ddlPurpose.SelectedIndex = 0;
            ddlPropertyType.SelectedIndex = 0;
            ddlTransactionType.SelectedIndex = 0;
            ddlBHK.SelectedIndex = 0;
            ddlFurnishing.SelectedIndex = 0;
            ddlParking.SelectedIndex = 0;
            ddlAge.SelectedIndex = 0;
            ddlFacing.SelectedIndex = 0;
            ddlAvailability.SelectedIndex = 0;
            ddlLoan.SelectedIndex = 0;

            foreach (ListItem item in cblAmenities.Items)
            {
                item.Selected = false;
            }
        }
    }
}

