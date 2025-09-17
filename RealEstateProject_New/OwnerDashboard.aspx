<%@ Page Title="RainbowHosing-OwnerDashboard" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="OwnerDashboard.aspx.cs" Inherits="RealEstateProject_New.OwnerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <div class="dashboard-header">
            <h2>Owner Dashboard</h2>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>Add / Edit / Delete Properties</h4>
                    <a href="AddProperty.aspx" class="btn btn-primary mt-3">Manage Properties</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>See Inquiries</h4>
                    <a href="Inquiries.aspx" class="btn btn-success mt-3">View Inquiries</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
