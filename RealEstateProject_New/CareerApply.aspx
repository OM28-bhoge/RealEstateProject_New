<%@ Page Title="RainbowHousing-Apply for Career" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="CareerApply.aspx.cs" Inherits="RealEstateProject_New.CareerApply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/career.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container py-5">
        <h2 class="fw-bold mb-4 text-center">Career Application Form</h2>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <asp:Panel ID="pnlForm" runat="server">
                    <div class="mb-3">
                        <asp:Label ID="lblPositionLabel" runat="server" Text="Position Applied For" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>

                    <!-- Full Name -->
                    <div class="mb-3">
                        <asp:Label ID="lblName" runat="server" Text="Full Name" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Full Name is required."
                            CssClass="text-danger"
                            Display="Dynamic" />
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required."
                            CssClass="text-danger"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Enter a valid email address."
                            CssClass="text-danger"
                            ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                            Display="Dynamic" />
                    </div>

                    <!-- Phone -->
                    <div class="mb-3">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" />
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Phone number is required."
                            CssClass="text-danger"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revPhone" runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Enter a valid 10-digit phone number."
                            CssClass="text-danger"
                            ValidationExpression="^\d{10}$"
                            Display="Dynamic" />
                    </div>

                    <!-- Resume Upload -->
                    <div class="mb-3">
                        <asp:Label ID="lblResume" runat="server" Text="Upload Resume" CssClass="form-label"></asp:Label>
                        <asp:FileUpload ID="fuResume" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvResume" runat="server"
                            ControlToValidate="fuResume"
                            InitialValue=""
                            ErrorMessage="Please upload your resume."
                            CssClass="text-danger"
                            Display="Dynamic" />
                        <!-- Removed CustomValidator to avoid compilation error -->
                    </div>

                    <div class="d-grid">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
