<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="RealEstateProject_New.AdminLogin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <link href="assets/css/adminstyle.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <div class="login-box">
            <h2>Admin Login</h2>
            <asp:TextBox ID="txtAdminID" runat="server" placeholder="Admin ID"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="aspNetBtn" />
            <asp:Label ID="lblError" runat="server" CssClass="error-msg"></asp:Label>
        </div>
    </form>
</body>
</html>
