<%@ Page Title="RainbowHosing-AddProperty" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="AddProperty.aspx.cs" Inherits="RealEstateProject_New.AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom CSS -->
    <link href="assets/css/addproperty.css" rel="stylesheet" />

    <!-- Bootstrap Multiselect CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-multiselect@1.1.0/dist/css/bootstrap-multiselect.css" rel="stylesheet" />

    <!-- jQuery (required first) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap Multiselect JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-multiselect@1.1.0/dist/js/bootstrap-multiselect.min.js"></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4 mb-5">
        <div class="card shadow-lg p-4 rounded-4">
            <h3 class="text-center mb-4">Add New Property</h3>

            <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold text-success"></asp:Label>

            <div class="row g-3">
                <!-- Title -->
                <div class="col-md-6">
                    <label class="form-label">Property Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter property title"></asp:TextBox>
                </div>

                <!-- Description -->
                <div class="col-md-6">
                    <label class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter description"></asp:TextBox>
                </div>

                <!-- Purpose (Sell / Rent) -->
                <div class="col-md-6">
                    <label class="form-label">I want to</label>
                    <asp:DropDownList ID="ddlPurpose" runat="server" CssClass="form-select" onchange="togglePriceFields()">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Sell" Value="Sell" />
                        <asp:ListItem Text="Rent" Value="Rent" />
                    </asp:DropDownList>
                </div>

                <!-- Sale Price (only when Sell is selected) -->
                <div class="col-md-6" id="salePriceDiv">
                    <label class="form-label">Sale Price (₹)</label>
                    <asp:TextBox ID="txtSalePrice" runat="server" CssClass="form-control" placeholder="Enter sale price"></asp:TextBox>
                </div>

                <!-- Rent Price (only when Rent is selected) -->
                <div class="col-md-6" id="rentPriceDiv">
                    <label class="form-label">Rent Price (₹/month)</label>
                    <asp:TextBox ID="txtRentPrice" runat="server" CssClass="form-control" placeholder="Enter monthly rent"></asp:TextBox>
                </div>

                <!-- Maintenance Charges -->
                <div class="col-md-6" id="maintenanceDiv">
                    <label class="form-label">Maintenance Charges (₹)</label>
                    <asp:TextBox ID="txtMaintenance" runat="server" CssClass="form-control" placeholder="e.g. 2500"></asp:TextBox>
                </div>

                <!-- Location -->
                <div class="col-md-6">
                    <label class="form-label">Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Enter city/location"></asp:TextBox>
                </div>

                <!-- Owner Name -->
                <div class="col-md-6">
                    <label class="form-label">Owner / Builder</label>
                    <asp:TextBox ID="txtOwner" runat="server" CssClass="form-control" placeholder="Enter owner or builder name"></asp:TextBox>
                </div>

                <!-- Property Type -->
                <div class="col-md-6">
                    <label class="form-label">Property Type</label>
                    <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-select" onchange="ToggleBedroomsBathrooms()">
                        <asp:ListItem Text="-- Select Type --" Value="" />
                        <asp:ListItem Text="Apartment" Value="Apartment" />
                        <asp:ListItem Text="Villa" Value="Villa" />
                        <asp:ListItem Text="Plot" Value="Plot" />
                        <asp:ListItem Text="Bungalow" Value="Bungalow" />
                        <asp:ListItem Text="Flat" Value="Flat" />
                    </asp:DropDownList>
                </div>

                <!-- Transaction Type (New / Resale) -->
                <div class="col-md-6">
                    <label class="form-label">Transaction Type</label>
                    <asp:DropDownList ID="ddlTransactionType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="New Property" Value="New" />
                        <asp:ListItem Text="Resale" Value="Resale" />
                    </asp:DropDownList>
                </div>



                <!-- BHK Type -->
                <div class="col-md-6" id="bhkDiv">
                    <label class="form-label">BHK Type</label>
                    <asp:DropDownList ID="ddlBHK" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select BHK --" Value="" />
                        <asp:ListItem Text="1 BHK" Value="1 BHK" />
                        <asp:ListItem Text="2 BHK" Value="2 BHK" />
                        <asp:ListItem Text="3 BHK" Value="3 BHK" />
                        <asp:ListItem Text="4 BHK" Value="4 BHK" />
                    </asp:DropDownList>
                </div>


                <!-- Bedrooms -->
                <div class="col-md-3" id="bedroomsDiv">
                    <label class="form-label">Bedrooms</label>
                    <asp:TextBox ID="txtBedrooms" runat="server" CssClass="form-control" placeholder="e.g. 3"></asp:TextBox>
                </div>

                <!-- Bathrooms -->
                <div class="col-md-3" id="bathroomsDiv">
                    <label class="form-label">Bathrooms</label>
                    <asp:TextBox ID="txtBathrooms" runat="server" CssClass="form-control" placeholder="e.g. 2"></asp:TextBox>
                </div>

                <!-- Carpet Area -->
                <div class="col-md-6">
                    <label class="form-label">Carpet Area (sq ft)</label>
                    <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" placeholder="e.g. 1500"></asp:TextBox>
                </div>

                <!-- Floor / Total Floors -->
                <div class="col-md-3">
                    <label class="form-label">Floor No</label>
                    <asp:TextBox ID="txtFloorNo" runat="server" CssClass="form-control" placeholder="e.g. 5"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Total Floors</label>
                    <asp:TextBox ID="txtTotalFloors" runat="server" CssClass="form-control" placeholder="e.g. 12"></asp:TextBox>
                </div>

                <!-- Furnishing -->
                <div class="col-md-6">
                    <label class="form-label">Furnishing Status</label>
                    <asp:DropDownList ID="ddlFurnishing" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Furnished" Value="Furnished" />
                        <asp:ListItem Text="Semi-Furnished" Value="Semi-Furnished" />
                        <asp:ListItem Text="Unfurnished" Value="Unfurnished" />
                    </asp:DropDownList>
                </div>

                <!-- Parking -->
                <div class="col-md-6">
                    <label class="form-label">Parking Type</label>
                    <asp:DropDownList ID="ddlParking" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Covered" Value="Covered" />
                        <asp:ListItem Text="Open" Value="Open" />
                        <asp:ListItem Text="None" Value="None" />
                    </asp:DropDownList>
                </div>


                <!-- Property Age -->
                <div class="col-md-6">
                    <label class="form-label">Property Age</label>
                    <asp:DropDownList ID="ddlAge" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="0-1 Year" Value="0-1 Year" />
                        <asp:ListItem Text="1-5 Years" Value="1-5 Years" />
                        <asp:ListItem Text="5-10 Years" Value="5-10 Years" />
                        <asp:ListItem Text="10+ Years" Value="10+ Years" />
                    </asp:DropDownList>
                </div>

                <!-- Facing -->
                <div class="col-md-6">
                    <label class="form-label">Facing</label>
                    <asp:DropDownList ID="ddlFacing" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="East" Value="East" />
                        <asp:ListItem Text="West" Value="West" />
                        <asp:ListItem Text="North" Value="North" />
                        <asp:ListItem Text="South" Value="South" />
                    </asp:DropDownList>
                </div>

                <!-- Availability -->
                <div class="col-md-6">
                    <label class="form-label">Availability</label>
                    <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-select" onchange="togglePossessionDate()">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Ready to Move" Value="Ready to Move" />
                        <asp:ListItem Text="Under Construction" Value="Under Construction" />
                        <asp:ListItem Text="Immediate" Value="Immediate" />
                        <asp:ListItem Text="Within 3 Months" Value="Within 3 Months" />
                        <asp:ListItem Text="Within 6 Months" Value="Within 6 Months" />
                        <asp:ListItem Text="1 Year+" Value="1 Year+" />
                    </asp:DropDownList>
                </div>

                <!-- Possession Date -->
                <div class="col-md-6" id="possessionDateDiv" style="display: none;">
                    <label class="form-label">Possession Date</label>
                    <asp:TextBox ID="txtPossessionDate" runat="server" CssClass="form-control" TextMode="Date" />
                </div>



                <!-- Amenities -->
                <div class="col-md-6">
                    <label class="form-label">Amenities</label>
                    <div class="dropdown w-100">
                        <!-- Fake select styled like DropDownList -->
                        <div class="form-select dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            Select Amenities
                        </div>

                        <!-- Dropdown menu with checkboxes -->
                        <div class="dropdown-menu p-2 w-100" style="max-height: 250px; overflow-y: auto;">
                            <asp:CheckBoxList ID="cblAmenities" runat="server"
                                RepeatDirection="Vertical"
                                CssClass="form-check">
                                <asp:ListItem Text="Swimming Pool" Value="Swimming Pool" />
                                <asp:ListItem Text="Gym" Value="Gym" />
                                <asp:ListItem Text="Club House" Value="Club House" />
                                <asp:ListItem Text="Security" Value="Security" />
                                <asp:ListItem Text="Lift" Value="Lift" />
                                <asp:ListItem Text="Power Backup" Value="Power Backup" />
                                <asp:ListItem Text="Children's Play Area" Value="Children's Play Area" />
                                <asp:ListItem Text="Garden" Value="Garden" />
                                <asp:ListItem Text="Community Hall" Value="Community Hall" />
                                <asp:ListItem Text="CCTV Surveillance" Value="CCTV Surveillance" />
                                <asp:ListItem Text="Jogging Track" Value="Jogging Track" />
                                <asp:ListItem Text="Indoor Games" Value="Indoor Games" />
                                <asp:ListItem Text="Library" Value="Library" />
                            </asp:CheckBoxList>
                        </div>
                    </div>
                </div>



                <!-- Loan Availability -->
                <div class="col-md-6">
                    <label class="form-label">Loan Availability</label>
                    <asp:DropDownList ID="ddlLoan" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Available" Value="Available" />
                        <asp:ListItem Text="Not Available" Value="Not Available" />
                    </asp:DropDownList>
                </div>

                <!-- Upload Image -->
                <div class="col-md-6">
                    <label class="form-label">Upload Image</label>
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" AllowMultiple="true" />
                </div>


                <!-- Submit -->
                <div class="text-center mt-4">
                    <asp:Button ID="btnSave" runat="server" Text="Save Property"
                        CssClass="btn btn-primary px-5 py-2 rounded-pill shadow-sm"
                        OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function ToggleBedroomsBathrooms() {
            var ddl = document.getElementById('<%= ddlPropertyType.ClientID %>');

            // Elements
            var bhkDiv = document.getElementById('<%= ddlBHK.ClientID %>').parentElement;
            var bedroomsDiv = document.getElementById('bedroomsDiv');
            var bathroomsDiv = document.getElementById('bathroomsDiv');
            var floorDiv = document.getElementById('<%= txtFloorNo.ClientID %>').parentElement;
            var totalFloorsDiv = document.getElementById('<%= txtTotalFloors.ClientID %>').parentElement;
            var furnishingDiv = document.getElementById('<%= ddlFurnishing.ClientID %>').parentElement;
            var parkingDiv = document.getElementById('<%= ddlParking.ClientID %>').parentElement;
            var maintenanceDiv = document.getElementById('<%= txtMaintenance.ClientID %>').parentElement;
            var availabilityDiv = document.getElementById('<%= ddlAvailability.ClientID %>').parentElement;
            var amenitiesDiv = document.getElementById('<%= cblAmenities.ClientID %>').parentElement.parentElement;

            if (ddl.value === "Apartment") {
                // Hide Bedrooms & Bathrooms
                bhkDiv.style.display = "none";
                bedroomsDiv.style.display = "none";
                bathroomsDiv.style.display = "none";
                floorDiv.style.display = "block";
                totalFloorsDiv.style.display = "block";
                furnishingDiv.style.display = "block";
                parkingDiv.style.display = "block";
                maintenanceDiv.style.display = "block";
                availabilityDiv.style.display = "block";
                amenitiesDiv.style.display = "block";

            } else if (ddl.value === "Plot") {
                // Hide Bedrooms, Bathrooms, Floors, Furnishing, Parking, Availability, Amenities
                bhkDiv.style.display = "none";
                bedroomsDiv.style.display = "none";
                bathroomsDiv.style.display = "none";
                floorDiv.style.display = "none";
                totalFloorsDiv.style.display = "none";
                furnishingDiv.style.display = "none";
                parkingDiv.style.display = "none";
                maintenanceDiv.style.display = "none";
                availabilityDiv.style.display = "none";
                amenitiesDiv.style.display = "none";

            } else if (ddl.value === "Villa" || ddl.value === "Bungalow") {
                // Hide Floors, show Bedrooms, Bathrooms, and others
                bhkDiv.style.display = "block";
                bedroomsDiv.style.display = "block";
                bathroomsDiv.style.display = "block";
                floorDiv.style.display = "none";
                totalFloorsDiv.style.display = "none";
                furnishingDiv.style.display = "block";
                parkingDiv.style.display = "block";
                maintenanceDiv.style.display = "none";
                availabilityDiv.style.display = "block";
                amenitiesDiv.style.display = "block";

            } else if (ddl.value === "Flat") {
                // ✅ For Flat → Show everything
                bhkDiv.style.display = "block";
                bedroomsDiv.style.display = "block";
                bathroomsDiv.style.display = "block";
                floorDiv.style.display = "block";
                totalFloorsDiv.style.display = "block";
                furnishingDiv.style.display = "block";
                parkingDiv.style.display = "block";
                maintenanceDiv.style.display = "block";
                availabilityDiv.style.display = "block";
                amenitiesDiv.style.display = "block";

            } else {
                // Default (when nothing is selected) → Show all
                bhkDiv.style.display = "block";
                bedroomsDiv.style.display = "block";
                bathroomsDiv.style.display = "block";
                floorDiv.style.display = "block";
                totalFloorsDiv.style.display = "block";
                furnishingDiv.style.display = "block";
                parkingDiv.style.display = "block";
                maintenanceDiv.style.display = "block";
                availabilityDiv.style.display = "block";
                amenitiesDiv.style.display = "block";
            }
        }

        function togglePriceFields() {
            var ddl = document.getElementById('<%= ddlPurpose.ClientID %>');
            var saleDiv = document.getElementById('salePriceDiv');
            var rentDiv = document.getElementById('rentPriceDiv');

            if (ddl.value === "Sell") {
                saleDiv.style.display = "block";
                rentDiv.style.display = "none";
            } else if (ddl.value === "Rent") {
                saleDiv.style.display = "none";
                rentDiv.style.display = "block";
            } else {
                // Default → Hide both
                saleDiv.style.display = "none";
                rentDiv.style.display = "none";
            }
        }

        function togglePossessionDate() {
            var ddl = document.getElementById('<%= ddlAvailability.ClientID %>');
            var possessionDiv = document.getElementById('possessionDateDiv');

            if (ddl.value === "Under Construction") {
                possessionDiv.style.display = "block";
            } else {
                possessionDiv.style.display = "none";
            }
        }


        window.onload = function () {
            togglePossessionDate();
            togglePriceFields();
            ToggleBedroomsBathrooms();
        };
    </script>

</asp:Content>
