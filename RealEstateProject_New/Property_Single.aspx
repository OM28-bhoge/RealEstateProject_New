<%@ Page Title="Property Details" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Property_Single.aspx.cs" Inherits="RealEstateProject_New.Property_Single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Error Label -->
    <asp:Label ID="lblError" runat="server" CssClass="text-danger" />

    <!-- Panel for property details -->
    <asp:Panel ID="pnlProperty" runat="server" Visible="false">
        <section class="ftco-section ftco-property-details">
            <div class="container">
                <div class="row">

                    <!-- Left Column: Images & Details -->
                    <div class="col-lg-8">

                        <!-- Image Slider -->
                        <div class="single-slider owl-carousel mb-4">
                            <asp:Repeater ID="rptImages" runat="server">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="properties-img"
                                            style='background-image: url("<%# Eval("ImageFile") %>"); height: 400px; background-size: cover; background-position: center;'>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <!-- Property Info -->
                        <div class="text">
                            <h2><asp:Label ID="lblTitle" runat="server" /></h2>
                            <span class="subheading"><i class="ion-ios-pin"></i> <asp:Label ID="lblLocation" runat="server" /></span>

                            <p class="price mb-3">
                                <span class="old-price" style="text-decoration: line-through; color: #999;">₹<asp:Label ID="lblOldPrice" runat="server" /></span>
                                <span class="orig-price">₹<asp:Label ID="lblLatestPrice" runat="server" /><small>/mo</small></span>
                            </p>

                            <p><asp:Label ID="lblDescription" runat="server" /></p>

                            <h4 class="mb-3">Property Details</h4>
                            <ul class="property_list">
                                <li><strong>BHK:</strong> <asp:Label ID="lblBHK" runat="server" /></li>
                                <li><strong>Bathrooms:</strong> <asp:Label ID="lblBathrooms" runat="server" /></li>
                                <li><strong>Area:</strong> <asp:Label ID="lblArea" runat="server" /> sqft</li>
                                <li><strong>Status:</strong> <asp:Label ID="lblStatus" runat="server" /></li>
                                <li><strong>Furnishing:</strong> <asp:Label ID="lblFurnishing" runat="server" /></li>
                                <li><strong>Floor:</strong> <asp:Label ID="lblFloor" runat="server" /></li>
                            </ul>
                        </div>

                    </div>

                    <!-- Right Column: Sidebar -->
                    <div class="col-lg-4">

                        <!-- Agent Info -->
                        <div class="sidebar-box agent-info p-4 mb-3 bg-light d-flex align-items-center">
                            <div id="agentImg" runat="server" style="width:120px; height:120px; border-radius:50%; background-size:cover;"></div>
                            <div class="agent-desc ms-3">
                                <h4><asp:Label ID="lblAgentName" runat="server" /></h4>
                                <p class="h-info"><span class="ion-ios-call"></span> <asp:Label ID="lblAgentPhone" runat="server" /></p>
                                <p class="h-info"><span class="ion-ios-mail"></span> <asp:Label ID="lblAgentEmail" runat="server" /></p>
                            </div>
                        </div>

                        <!-- Enquiry Form -->
                        <div class="sidebar-box p-4 mb-3 bg-light">
                            <h3 class="heading">Enquiry</h3>
                            <div class="form-group mb-2">
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Placeholder="Your Name" />
                            </div>
                            <div class="form-group mb-2">
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Your Email" />
                            </div>
                            <div class="form-group mb-2">
                                <asp:TextBox ID="txtMessage" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3" Placeholder="Message" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnSend" CssClass="btn btn-primary py-3 px-4" runat="server" Text="Send Message" OnClick="btnSend_Click" />
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".single-slider").owlCarousel({
                items: 1,
                loop: true,
                nav: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 4000,
                autoplayHoverPause: true,
                navText: ["<", ">"]
            });
        });
    </script>
</asp:Content>
