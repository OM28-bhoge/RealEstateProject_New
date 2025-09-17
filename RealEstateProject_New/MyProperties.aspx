<%@ Page Title="RainbowHosing-MyProperties" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="MyProperties.aspx.cs" Inherits="RealEstateProject_New.MyProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/userstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>My Added Properties</h2>
            <!-- Add Property Button -->
            <a href="AddProperty.aspx" class="btn btn-success">Add Property</a>
        </div>
        <hr />

        <asp:Repeater ID="rptUserProperties" runat="server">
            <ItemTemplate>
                <div class="card mb-3 shadow-sm" style="width: 18rem; display: inline-block; margin: 10px;">
                    <img class="card-img-top" src='<%# Eval("ImagePath") ?? "assets/images/default-property.jpg" %>'
                        alt="Property Image" style="height: 150px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("Title") %></h5>
                        <p class="card-text">Location: <%# Eval("Location") %></p>
                        <p class="card-text">Price: ₹ <%# Eval("Price") %></p>
                        <a href='PropertyDetails.aspx?PropertyID=<%# Eval("PropertyID") %>' class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="lblNoProperties" runat="server" CssClass="text-muted"></asp:Label>
    </div>
</asp:Content>
