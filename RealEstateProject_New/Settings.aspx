<%@ Page Title="RainbowHosing-Settings" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="RealEstateProject_New.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/userstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="profile-container">
        <div class="profile-header">
            <h2>Application Settings</h2>
            <p>Update your preferences below</p>
        </div>

        <div class="profile-form">
            <!-- Notifications -->
            <div class="form-group checkbox-group">
                <asp:CheckBox ID="chkNotifications" runat="server" CssClass="form-control-checkbox" />
                <asp:Label runat="server" AssociatedControlID="chkNotifications" Text="Enable Notifications"></asp:Label>
            </div>

            <!-- Theme -->
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlTheme" Text="Theme"></asp:Label>
                <asp:DropDownList ID="ddlTheme" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Light" Value="Light"></asp:ListItem>
                    <asp:ListItem Text="Dark" Value="Dark"></asp:ListItem>
                    <asp:ListItem Text="System Default" Value="System"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Language -->
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlLanguage" Text="Language"></asp:Label>
                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
                    <asp:ListItem Text="English" Value="en"></asp:ListItem>
                    <asp:ListItem Text="Hindi" Value="hi"></asp:ListItem>
                    <asp:ListItem Text="Marathi" Value="mr"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Save Button -->
            <div class="form-group">
                <asp:Button ID="btnSaveSettings" runat="server" Text="Save Settings" CssClass="btn btn-primary" OnClick="btnSaveSettings_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
        </div>
    </div>
</asp:Content>