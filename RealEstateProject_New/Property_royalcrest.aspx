<%@ Page Title="RainbowHousing-RoyalCrest" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Property_royalcrest.aspx.cs" Inherits="RealEstateProject_New.Property_royalcrest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-utbXr2/Zd6Uuvc1Td6XlBefEOtAhhFV7p8aGnhIeyC77ZqL77z3qG0+yzOz6c6/jA1Z5i1Okh9N+T9X/1v3mJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-3fF/0oh6FYKqjWrn64/UDrqF3Frdx0cdBq5hhGcgPzBv0PVHq8p2S8YyfjM7CwFSZt1FyEp7RRLg0l4R1E+4Iw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ftco-section ftco-property-details">
        <div class="container">
            <div class="row">
                <!-- Property Images & Details -->
                <div class="col-lg-8">
                    <!-- Image Slider -->
                    <div class="single-slider owl-carousel mb-4">
                        <asp:Repeater ID="rptImages" runat="server">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="properties-img" style='background-image: url("assets/Images/Property-1.jpg"); height: 400px; background-size: cover; background-position: center;'></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Property Info -->
                    <div class="text">
                        <h2>
                            <asp:Label ID="lblTitle" runat="server" /></h2>
                        <span class="subheading"><i class="ion-ios-pin"></i>
                            <asp:Label ID="lblLocation" runat="server" /></span>

                        <p class="price mb-3">
                            <span class="old-price" style="text-decoration: line-through; color: #999;">₹<asp:Label ID="lblOldPrice" runat="server" /></span>
                            <span class="orig-price">₹<asp:Label ID="lblLatestPrice" runat="server" /><small>/mo</small></span>
                        </p>

                        <p>
                            <asp:Label ID="lblDescription" runat="server" /></p>

                        <h4 class="mb-3">Property Details</h4>
                        <ul class="property_list">
                            <li><strong>BHK:</strong>
                                <asp:Label ID="lblBHK" runat="server" /></li>
                            <li><strong>Bathrooms:</strong>
                                <asp:Label ID="lblBathrooms" runat="server" /></li>
                            <li><strong>Area:</strong>
                                <asp:Label ID="lblArea" runat="server" />
                                sqft</li>
                            <li><strong>Status:</strong>
                                <asp:Label ID="lblStatus" runat="server" /></li>
                            <li><strong>Furnishing:</strong>
                                <asp:Label ID="lblFurnishing" runat="server" /></li>
                            <li><strong>Floor:</strong>
                                <asp:Label ID="lblFloor" runat="server" /></li>
                        </ul>

                        <!-- Amenities -->
                        <div class="amenities-section mb-4">
                            <h4 class="mb-3">Amenities</h4>
                            <div class="row">
                                <div class="col-6 col-md-4"><i class="fa fa-swimming-pool me-2"></i>Swimming Pool</div>
                                <div class="col-6 col-md-4"><i class="fa fa-dumbbell me-2"></i>Gym</div>
                                <div class="col-6 col-md-4"><i class="fa fa-child me-2"></i>Play Area</div>
                                <div class="col-6 col-md-4"><i class="fa fa-shield-alt me-2"></i>24/7 Security</div>
                                <div class="col-6 col-md-4"><i class="fa fa-club me-2"></i>Clubhouse</div>
                                <div class="col-6 col-md-4"><i class="fa fa-parking me-2"></i>Parking</div>
                            </div>
                        </div>

                        <!-- Features -->
                        <div class="features-section mb-4">
                            <h4 class="mb-3">Features</h4>
                            <ul class="features_list list-unstyled">
                                <li><i class="fa fa-check-circle text-success me-2"></i>Vastu Compliant</li>
                                <li><i class="fa fa-check-circle text-success me-2"></i>Modern Kitchen</li>
                                <li><i class="fa fa-check-circle text-success me-2"></i>Wooden Flooring</li>
                                <li><i class="fa fa-check-circle text-success me-2"></i>Power Backup</li>
                                <li><i class="fa fa-check-circle text-success me-2"></i>High-Speed Internet</li>
                                <li><i class="fa fa-check-circle text-success me-2"></i>Balcony with City View</li>
                            </ul>
                        </div>

                        <!-- Nearby Facilities -->
                        <div class="nearby-section mb-4">
                            <h4 class="mb-3">Nearby Facilities</h4>
                            <ul class="nearby_list list-unstyled">
                                <li><i class="fa fa-school me-2"></i>ABC International School - 1 km</li>
                                <li><i class="fa fa-hospital me-2"></i>XYZ Hospital - 2 km</li>
                                <li><i class="fa fa-shopping-cart me-2"></i>Pune Central Mall - 1.5 km</li>
                                <li><i class="fa fa-bus me-2"></i>Metro / Bus Station - 500 m</li>
                                <li><i class="fa fa-tree me-2"></i>Central Park - 700 m</li>
                            </ul>
                        </div>

                        <!-- Floor Plan -->
                        <div class="floorplan-section mb-4">
                            <h4 class="mb-3">Floor Plan</h4>
                            <img src="assets/Images/FloorPlan1.jpg" alt="Floor Plan" class="img-fluid rounded shadow-sm" />
                        </div>

                        <div class="map-section mb-4">
                            <h4 class="mb-3">Location on Map</h4>
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.123456789!2d73.869743!3d18.536216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c1234567890%3A0xabcdef123456789!2sKoregaon%20Park%2C%20Pune%2C%20Maharashtra%2C%20India!5e0!3m2!1sen!2sin!4v1694771234567"
                                width="100%"
                                height="350"
                                style="border: 0;"
                                allowfullscreen=""
                                loading="lazy"></iframe>
                        </div>

                        <!-- Reviews -->
                        <div class="reviews-section mb-4">
                            <h4 class="mb-3">Customer Reviews</h4>
                            <div class="review mb-3 p-3 bg-light rounded shadow-sm">
                                <strong>John Doe</strong> <span class="text-muted">- Jan 2025</span>
                                <p>Excellent property with amazing amenities and a prime location!</p>
                            </div>
                            <div class="review mb-3 p-3 bg-light rounded shadow-sm">
                                <strong>Jane Smith</strong> <span class="text-muted">- Feb 2025</span>
                                <p>Spacious rooms, well-maintained, and friendly agent support.</p>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Sidebar: Agent & Enquiry -->
                <div class="col-lg-4">
                    <!-- Agent Info -->
                    <div class="sidebar-box agent-info p-4 mb-3 bg-light d-flex align-items-center">
                        <div class="agent-img me-3" id="agentImg" runat="server" style="width: 120px; height: 120px; border-radius: 50%; background-size: cover; background-position: center;"></div>
                        <div class="agent-desc">
                            <h4>
                                <asp:Label ID="lblAgentName" runat="server" /></h4>
                            <p class="h-info"><span class="ion-ios-call"></span>
                                <asp:Label ID="lblAgentPhone" runat="server" /></p>
                            <p class="h-info"><span class="ion-ios-mail"></span>
                                <asp:Label ID="lblAgentEmail" runat="server" /></p>
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
                            <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary py-3 px-4" Text="Send Message" />
                        </div>
                    </div>
                </div>

            </div>

            <asp:Label ID="lblError" runat="server" ForeColor="Red" />
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Owl Carousel JS -->
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
