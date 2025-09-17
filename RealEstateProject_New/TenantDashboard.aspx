<%@ Page Title="RainbowHosing-TenantDashboard" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="TenantDashboard.aspx.cs" Inherits="RealEstateProject_New.TenantDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <div class="dashboard-header">
            <h2>Tenant Dashboard</h2>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card p-4">
                    <h4>View Rental Properties</h4>
                    <a href="RentalProperties.aspx" class="btn btn-primary mt-3">Browse Rentals</a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card p-4">
                    <h4>Contact Landlords / Agents</h4>
                    <a href="Contact.aspx" class="btn btn-success mt-3">Contact</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
