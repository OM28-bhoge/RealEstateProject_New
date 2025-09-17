<%@ Page Title="RainbowHosing-MyProfile" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="RealEstateProject_New.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/profile.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="profile-header text-center">
            <img src="assets/images/user.jpg" alt="User Avatar" class="profile-avatar" />
            <h2>Username:
                <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
            </h2>
            <p>
                Role:
                <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
            </p>
        </div>



        <div class="profile-form">
            <asp:Label runat="server" AssociatedControlID="txtFullName" Text="Full Name"></asp:Label>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtEmail" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtCountryCode" Text="Country Code"></asp:Label>
            <asp:TextBox ID="txtCountryCode" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtMobile" Text="Mobile"></asp:Label>
            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtUsername" Text="Username"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="ddlGender" Text="Gender"></asp:Label>
            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>

            <asp:Label runat="server" AssociatedControlID="txtDOB" Text="Date of Birth"></asp:Label>
            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtAddress" Text="Address"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtCity" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="txtState" Text="State"></asp:Label>
            <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>


            <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile"
                CssClass="btn btn-primary mt-3" OnClick="btnUpdateProfile_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-2"></asp:Label>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
