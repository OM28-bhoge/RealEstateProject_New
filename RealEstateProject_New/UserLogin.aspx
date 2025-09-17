<%@ Page Title="RainbowHosing-UserLogin" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="RealEstateProject_New.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/auth.css" rel="stylesheet" />
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auth">
        <div class="auth-form-light">
            <div class="brand-logo">
                <img src="assets/Images/logo1.jpg" alt="Logo" class="logo-img" />
            </div>

            <h4 class="text-dark fw-bold">Welcome User!</h4>
            <h6 class="text-muted">Sign in to continue</h6>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txtUser"
                    ErrorMessage="* Username is required." CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass"
                    ErrorMessage="* Password is required." CssClass="text-danger" Display="Dynamic" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />

            <div class="d-grid gap-2 mb-3">
                <asp:Button ID="btnLogin" runat="server" Text="Sign In"
                    CssClass="auth-form-btn btn-gradient-primary" OnClick="btnLogin_Click" />
            </div>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label text-muted" for="chkRemember">Keep me signed in</label>
                </div>
                <a href="#" class="auth-link">Forgot password?</a>
            </div>

            <div class="d-grid gap-2 mb-3">
                <asp:Button ID="btnFacebook" runat="server" Text="Connect using Facebook"
                    CssClass="auth-form-btn btn-facebook btn-gradient-primary" />
            </div>

            <div class="text-center mt-3">
                <span class="text-muted">Don’t have an account? </span>
                <a href="UserRegister.aspx" class="auth-link">Create</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>