using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace RealEstateProject_New
{
    public partial class ManageProperty : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["CON"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProperties("All"); // Load all properties initially
            }
        }

        // Load all properties with optional purpose filter
        private void LoadProperties(string purposeFilter)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "SELECT * FROM Properties WHERE UserID=@UserID";

                if (purposeFilter != "All")
                    query += " AND Purpose=@Purpose";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                if (purposeFilter != "All")
                    cmd.Parameters.AddWithValue("@Purpose", purposeFilter);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvProperties.DataSource = dt;
                gvProperties.DataBind();

                // Dynamically show/hide SalePrice or RentPrice
                gvProperties.Columns[4].Visible = purposeFilter != "Rent"; // SalePrice
                gvProperties.Columns[5].Visible = purposeFilter != "Sell"; // RentPrice
            }
        }

        // Dropdown change event
        protected void ddlPurposeFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProperties(ddlPurposeFilter.SelectedValue);
        }

        protected void gvProperties_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProperties.EditIndex = e.NewEditIndex;
            LoadProperties(ddlPurposeFilter.SelectedValue);
        }

        protected void gvProperties_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProperties.EditIndex = -1;
            LoadProperties(ddlPurposeFilter.SelectedValue);
        }

        protected void gvProperties_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int propertyID = Convert.ToInt32(gvProperties.DataKeys[e.RowIndex].Value);

            GridViewRow row = gvProperties.Rows[e.RowIndex];

            // Retrieve values from all columns
            string title = (row.Cells[1].Controls[0] as TextBox)?.Text;
            string description = (row.Cells[2].Controls[0] as TextBox)?.Text;
            string purpose = (row.Cells[3].Controls[0] as TextBox)?.Text;
            string salePrice = (row.Cells[4].Controls[0] as TextBox)?.Text;
            string rentPrice = (row.Cells[5].Controls[0] as TextBox)?.Text;
            string maintenance = (row.Cells[6].Controls[0] as TextBox)?.Text;
            string location = (row.Cells[7].Controls[0] as TextBox)?.Text;
            string propertyType = (row.Cells[8].Controls[0] as TextBox)?.Text;
            string bedrooms = (row.Cells[9].Controls[0] as TextBox)?.Text;
            string bathrooms = (row.Cells[10].Controls[0] as TextBox)?.Text;
            string area = (row.Cells[11].Controls[0] as TextBox)?.Text;
            string bhkType = (row.Cells[12].Controls[0] as TextBox)?.Text;
            string furnishing = (row.Cells[13].Controls[0] as TextBox)?.Text;
            string parking = (row.Cells[14].Controls[0] as TextBox)?.Text;
            string amenities = (row.Cells[15].Controls[0] as TextBox)?.Text;
            string floorNo = (row.Cells[16].Controls[0] as TextBox)?.Text;
            string totalFloors = (row.Cells[17].Controls[0] as TextBox)?.Text;
            string propertyAge = (row.Cells[18].Controls[0] as TextBox)?.Text;
            string facing = (row.Cells[19].Controls[0] as TextBox)?.Text;
            string availability = (row.Cells[20].Controls[0] as TextBox)?.Text;
            string possessionDate = (row.Cells[21].Controls[0] as TextBox)?.Text;
            string transactionType = (row.Cells[22].Controls[0] as TextBox)?.Text;
            string loanAvailability = (row.Cells[23].Controls[0] as TextBox)?.Text;
            string ownerName = (row.Cells[24].Controls[0] as TextBox)?.Text;
            string imagePath = (row.Cells[25].Controls[0] as TextBox)?.Text;
            string createdBy = (row.Cells[26].Controls[0] as TextBox)?.Text;
            string createdDate = (row.Cells[27].Controls[0] as TextBox)?.Text;
            string userID = (row.Cells[28].Controls[0] as TextBox)?.Text;

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = @"
                    UPDATE Properties SET
                        Title=@Title,
                        Description=@Description,
                        Purpose=@Purpose,
                        SalePrice=@SalePrice,
                        RentPrice=@RentPrice,
                        MaintenanceCharges=@MaintenanceCharges,
                        Location=@Location,
                        PropertyType=@PropertyType,
                        Bedrooms=@Bedrooms,
                        Bathrooms=@Bathrooms,
                        AreaSqFt=@AreaSqFt,
                        BHKType=@BHKType,
                        FurnishingStatus=@FurnishingStatus,
                        ParkingType=@ParkingType,
                        Amenities=@Amenities,
                        FloorNo=@FloorNo,
                        TotalFloors=@TotalFloors,
                        PropertyAge=@PropertyAge,
                        Facing=@Facing,
                        Availability=@Availability,
                        PossessionDate=@PossessionDate,
                        TransactionType=@TransactionType,
                        LoanAvailability=@LoanAvailability,
                        OwnerName=@OwnerName,
                        ImagePath=@ImagePath,
                        CreatedBy=@CreatedBy
                    WHERE PropertyID=@PropertyID";

                SqlCommand cmd = new SqlCommand(query, con);

                // Add parameters safely
                cmd.Parameters.AddWithValue("@Title", title ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Description", description ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Purpose", purpose ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@SalePrice", string.IsNullOrEmpty(salePrice) ? (object)DBNull.Value : salePrice);
                cmd.Parameters.AddWithValue("@RentPrice", string.IsNullOrEmpty(rentPrice) ? (object)DBNull.Value : rentPrice);
                cmd.Parameters.AddWithValue("@MaintenanceCharges", string.IsNullOrEmpty(maintenance) ? (object)DBNull.Value : maintenance);
                cmd.Parameters.AddWithValue("@Location", location ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@PropertyType", propertyType ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Bedrooms", string.IsNullOrEmpty(bedrooms) ? (object)DBNull.Value : bedrooms);
                cmd.Parameters.AddWithValue("@Bathrooms", string.IsNullOrEmpty(bathrooms) ? (object)DBNull.Value : bathrooms);
                cmd.Parameters.AddWithValue("@AreaSqFt", string.IsNullOrEmpty(area) ? (object)DBNull.Value : area);
                cmd.Parameters.AddWithValue("@BHKType", bhkType ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@FurnishingStatus", furnishing ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@ParkingType", parking ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Amenities", amenities ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@FloorNo", string.IsNullOrEmpty(floorNo) ? (object)DBNull.Value : floorNo);
                cmd.Parameters.AddWithValue("@TotalFloors", string.IsNullOrEmpty(totalFloors) ? (object)DBNull.Value : totalFloors);
                cmd.Parameters.AddWithValue("@PropertyAge", string.IsNullOrEmpty(propertyAge) ? (object)DBNull.Value : propertyAge);
                cmd.Parameters.AddWithValue("@Facing", facing ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Availability", availability ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@PossessionDate", string.IsNullOrEmpty(possessionDate) ? (object)DBNull.Value : possessionDate);
                cmd.Parameters.AddWithValue("@TransactionType", transactionType ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@LoanAvailability", loanAvailability ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@OwnerName", ownerName ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@CreatedBy", createdBy ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@PropertyID", propertyID);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvProperties.EditIndex = -1;
            LoadProperties(ddlPurposeFilter.SelectedValue);
        }

        protected void gvProperties_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int propertyID = Convert.ToInt32(gvProperties.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "DELETE FROM Properties WHERE PropertyID=@PropertyID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PropertyID", propertyID);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadProperties(ddlPurposeFilter.SelectedValue);
        }
    }
}
