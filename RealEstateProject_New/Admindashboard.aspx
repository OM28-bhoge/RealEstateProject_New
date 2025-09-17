<%@ Page Title="RainbowHosing-AdminDashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admindashboard.aspx.cs" Inherits="RealEstateProject_New.Admindashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Panel - Dashboard</title>
    <link href="assets/css/adminstyle.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Welcome message -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <asp:Label ID="lblWelcome" runat="server" CssClass="fw-bold fs-5 text-primary" Text="Welcome, Admin"></asp:Label>
    </div>

    <div class="container-fluid py-4">
        <!-- Title Row -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h3 class="fw-bold text-dark">
                    <i class="fa fa-home text-primary me-2"></i>Dashboard
                </h3>
                <span class="text-purple fw-semibold">Overview <i class="fa fa-info-circle"></i></span>
            </div>
        </div>

        <!-- Cards Row -->
        <div class="row g-4">

            <!-- Registered Users -->
            <div class="col-md-3 col-lg-3">
                <a href="TotalUsers.aspx" class="text-decoration-none">
                    <div class="card text-white bg-gradient-purple shadow-lg rounded-3 h-100">
                        <div class="card-body">
                            <h5 class="card-title">Registered Users <i class="fa fa-users float-end"></i></h5>
                            <h2 class="fw-bold">
                                <asp:Label ID="lblUsers" runat="server" Text="0"></asp:Label>
                            </h2>
                            <p>Total users in system</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Properties Added -->
            <div class="col-md-3 col-lg-3">
                <a href="TotalProperties.aspx" class="text-decoration-none">
                    <div class="card text-white bg-gradient-orange shadow-lg rounded-3 h-100">
                        <div class="card-body">
                            <h5 class="card-title">Properties <i class="fa fa-building float-end"></i></h5>
                            <h2 class="fw-bold">
                                <asp:Label ID="lblProperties" runat="server" Text="0"></asp:Label>
                            </h2>
                            <p>Total properties added</p>
                        </div>
                    </div>
                </a>
            </div>
            <!-- New Card: Career Applications -->
            <div class="col-md-3 col-lg-3">
                <a href="CareerApplications.aspx" class="text-decoration-none">
                    <div class="card text-white bg-gradient-teal shadow-lg rounded-3 h-100">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Career Applications</h5>
                                <i class="fa fa-envelope fs-5"></i>
                            </div>
                            <h2 class="fw-bold mt-3">
                                <asp:Label ID="lblCareerApplications" runat="server" Text="0"></asp:Label>
                            </h2>
                            <p>Total applications received</p>
                        </div>
                    </div>
                </a>
            </div>
            <!-- Received Contacts -->
            <div class="col-md-3 col-lg-3">
                <a href="TotalContacts.aspx" class="text-decoration-none">
                    <div class="card text-white bg-success shadow-lg rounded-3 h-100">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Received Contacts</h5>
                                <i class="fa fa-address-book fs-5"></i>
                            </div>
                            <h2 class="fw-bold mt-3">
                                <asp:Label ID="lblReceivedContacts" runat="server" Text="0"></asp:Label>
                            </h2>
                            <p>Total contact requests</p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>

    <!-- Add Charts or other sections here if needed -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="assets/js/custom.js"></script>
    <script>
        // Add any Chart.js or custom JS code here
    </script>
</asp:Content>
