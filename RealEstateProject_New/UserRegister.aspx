<%@ Page Title="RainbowHosing-UserRegister" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="RealEstateProject_New.UserRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/auth.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auth">
        <div class="auth-form-light">
            <div class="brand-logo">
                <img src="assets/images/logo1.jpg" alt="Logo" />
            </div>

            <h4>Create Your Account</h4>
            <h6 class="font-weight-light">Sign up in just a few steps</h6>

            <asp:Label ID="lblMessage" runat="server"></asp:Label>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="* Please enter your full name." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="* Please enter your email." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="* Please enter a valid email." CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                    ErrorMessage="* Please enter a username." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Select Role --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Buyer" Value="Buyer"></asp:ListItem>
                    <asp:ListItem Text="Owner" Value="Owner"></asp:ListItem>
                    <asp:ListItem Text="Tenant" Value="Tenant"></asp:ListItem>
                    <asp:ListItem Text="Agent" Value="Agent"></asp:ListItem>
                    <asp:ListItem Text="Builder" Value="Builder"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole"
                    InitialValue="" ErrorMessage="* Please select a role." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <div class="mobile-row">
                    <asp:DropDownList ID="ddlCountryCode" runat="server" CssClass="form-control country-code">
                        <asp:ListItem Text="+91" Value="+91"></asp:ListItem>
                        <asp:ListItem Text="+1" Value="+1"></asp:ListItem>
                        <asp:ListItem Text="+44" Value="+44"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control mobile-input" placeholder="Mobile Number"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                    ErrorMessage="* Please enter your mobile number." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                    ValidationExpression="^[0-9]{10}$" ErrorMessage="* Please enter a valid 10-digit number." CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group validation-container">
                <div class="gender-row">
                    <asp:Label ID="lblGender" runat="server" Text="Gender     :" CssClass="gender-label"></asp:Label>
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" CssClass="form-check gender-radio-list">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender"
                    ErrorMessage="* Please select your gender." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container" style="margin-top: 15px;">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="* Please enter your address." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="* Please enter your city." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Select State --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                    <asp:ListItem Text="Gujarat" Value="Gujarat"></asp:ListItem>
                    <asp:ListItem Text="Karnataka" Value="Karnataka"></asp:ListItem>
                    <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState"
                    InitialValue="" ErrorMessage="* Please select your state." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"
                    TextMode="Date" placeholder="Date Of Birth"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB"
                    ErrorMessage="* Please enter your date of birth." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>



            <div class="form-group validation-container">
                <asp:FileUpload ID="fuIDProof" runat="server" CssClass="form-control" placeholder="Enter Your ID Proof"/>
                <asp:RequiredFieldValidator ID="rfvIDProof" runat="server" ControlToValidate="fuIDProof" ErrorMessage="* Please upload your ID proof." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revFileType" runat="server" ControlToValidate="fuIDProof" ValidationExpression="(.*?)\.(jpg|jpeg|png|pdf|doc|docx|JPG|JPEG|PNG|PDF|DOC|DOCX)$" ErrorMessage="* Only JPG, PNG, PDF, DOC files are allowed." CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>




            <div class="form-group validation-container">
                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass"
                    ErrorMessage="* Please enter a password." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group validation-container">
                <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPass"
                    ErrorMessage="* Please confirm your password." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cmpPass" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtPass"
                    ErrorMessage="* Passwords do not match." CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
            </div>

            <div class="mt-3 d-grid gap-2">
                <asp:Button ID="btnRegister" runat="server" Text="REGISTER"
                    CssClass="btn btn-gradient-primary auth-form-btn" OnClick="btnRegister_Click" />
            </div>

            <div class="text-center mt-3">
                <span class="text-muted">Already have an account? </span>
                <a href="UserLogin.aspx" class="text-primary fw-semibold">Login</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
