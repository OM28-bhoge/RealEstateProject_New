<%@ Page Title="RainbowHosing-BuyerDashboard" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="BuyerDashboard.aspx.cs" Inherits="RealEstateProject_New.BuyerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <div class="dashboard-header">
            <h2>Buyer Dashboard</h2>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>Search Properties</h4>
                    <a href="ViewProperties.aspx" class="btn btn-primary mt-3">Search Now</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>Save Favorites</h4>
                    <a href="Favorites.aspx" class="btn btn-info mt-3">My Favorites</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>Contact Owners/Agents</h4>
                    <a href="Contact.aspx" class="btn btn-success mt-3">Contact</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
