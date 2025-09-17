<%@ Page Title="RainbowHosing-BuilderDashboard" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="BuilderDashboard.aspx.cs" Inherits="RealEstateProject_New.BuilderDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/dashboard.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <div class="dashboard-header">
            <h2>Builder Dashboard</h2>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>Post New <br />Projects</h4>
                    <a href="AddProperty.aspx" class="btn btn-primary mt-3">Add Project</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>Upload Brochures & Images</h4>
                    <a href="UploadBrochure.aspx" class="btn btn-warning mt-3">Upload</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
