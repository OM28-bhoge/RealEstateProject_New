<%@ Page Title="RainbowHosing-ManageProperty" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="ManageProperty.aspx.cs" Inherits="RealEstateProject_New.ManageProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/userstyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ftco-section">
        <div class="container">
            <h2 class="mb-4 text-center">Manage Your Properties</h2>
            <!-- Purpose Filter Dropdown -->
            <div class="mb-3 text-center">
                <asp:DropDownList ID="ddlPurposeFilter" runat="server" AutoPostBack="True" CssClass="form-select w-auto"
                    OnSelectedIndexChanged="ddlPurposeFilter_SelectedIndexChanged">
                    <asp:ListItem Text="All" Value="All" />
                    <asp:ListItem Text="Sell" Value="Sell" />
                    <asp:ListItem Text="Rent" Value="Rent" />
                </asp:DropDownList>
            </div>
            <asp:GridView ID="gvProperties" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered property-table"
                DataKeyNames="PropertyID" OnRowEditing="gvProperties_RowEditing"
                OnRowUpdating="gvProperties_RowUpdating" OnRowCancelingEdit="gvProperties_RowCancelingEdit"
                OnRowDeleting="gvProperties_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="PropertyID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                    <asp:BoundField DataField="SalePrice" HeaderText="Sale Price" />
                    <asp:BoundField DataField="RentPrice" HeaderText="Rent Price" />
                    <asp:BoundField DataField="MaintenanceCharges" HeaderText="Maintenance" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="PropertyType" HeaderText="Type" />
                    <asp:BoundField DataField="Bedrooms" HeaderText="Bedrooms" />
                    <asp:BoundField DataField="Bathrooms" HeaderText="Bathrooms" />
                    <asp:BoundField DataField="AreaSqFt" HeaderText="Area (SqFt)" />
                    <asp:BoundField DataField="BHKType" HeaderText="BHK Type" />
                    <asp:BoundField DataField="FurnishingStatus" HeaderText="Furnishing" />
                    <asp:BoundField DataField="ParkingType" HeaderText="Parking" />
                    <asp:BoundField DataField="Amenities" HeaderText="Amenities" />
                    <asp:BoundField DataField="FloorNo" HeaderText="Floor No" />
                    <asp:BoundField DataField="TotalFloors" HeaderText="Total Floors" />
                    <asp:BoundField DataField="PropertyAge" HeaderText="Property Age" />
                    <asp:BoundField DataField="Facing" HeaderText="Facing" />
                    <asp:BoundField DataField="Availability" HeaderText="Availability" />
                    <asp:BoundField DataField="PossessionDate" HeaderText="Possession Date" />
                    <asp:BoundField DataField="TransactionType" HeaderText="Transaction Type" />
                    <asp:BoundField DataField="LoanAvailability" HeaderText="Loan Availability" />
                    <asp:BoundField DataField="OwnerName" HeaderText="Owner" />
                    <asp:BoundField DataField="ImagePath" HeaderText="Image Path" />
                    <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" />
                    
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-edit" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-delete" OnClientClick="return confirm('Are you sure?');" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
