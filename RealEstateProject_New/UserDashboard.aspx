<%@ Page Title="RainbowHousing-UserDashboard" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="RealEstateProject_New.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap" style="background-image: url('assets/Images/bg_2.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="overlay-2"></div>
        <div class="container h-100">
            <div class="row no-gutters slider-text justify-content-center align-items-center h-100">
                <div class="col-lg-6 col-md-8 ftco-animate d-flex align-items-center">
                    <div class="text text-center w-100">
                        <h1 class="mb-4">Find Properties
                        <br>
                            That Make You Money
                        </h1>
                        <p><a href="properties.aspx" class="btn btn-primary py-3 px-4">Search Properties</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="mouse">
            <a href="#" class="mouse-icon">
                <div class="mouse-wheel"><span class="ion-ios-arrow-round-down"></span></div>
            </a>
        </div>
    </div>


    <section class="ftco-section ftco-no-pb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="search-wrap-1 ftco-animate">
                        <asp:Panel runat="server" CssClass="search-property-1 bg-light p-4">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Location</label>
                                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="City/Locality Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" ErrorMessage="Location is required" CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Property Type</label>
                                        <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Select Type" Value="" />
                                            <asp:ListItem Text="Commercial" Value="Commercial" />
                                            <asp:ListItem Text="Office" Value="Office" />
                                            <asp:ListItem Text="Residential" Value="Residential" />
                                            <asp:ListItem Text="Villa" Value="Villa" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvPropertyType" runat="server" ControlToValidate="ddlPropertyType" InitialValue="" ErrorMessage="Property Type is required" CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Property Status</label>
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Select Status" Value="" />
                                            <asp:ListItem Text="Rent" Value="Rent" />
                                            <asp:ListItem Text="Sale" Value="Sale" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" InitialValue="" ErrorMessage="Status is required" CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Price Limit</label>
                                        <asp:DropDownList ID="ddlPrice" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Select Price" Value="" />
                                            <asp:ListItem Text="₹45,00,000" Value="4500000" />
                                            <asp:ListItem Text="₹55,00,000" Value="5500000" />
                                            <asp:ListItem Text="₹65,00,000" Value="6500000" />
                                            <asp:ListItem Text="₹70,00,000" Value="7000000" />
                                            <asp:ListItem Text="₹75,00,000" Value="7500000" />
                                            <asp:ListItem Text="₹80,00,000" Value="8000000" />
                                            <asp:ListItem Text="₹85,00,000" Value="8500000" />
                                            <asp:ListItem Text="₹90,00,000" Value="9000000" />
                                            <asp:ListItem Text="₹95,00,000" Value="9500000" />
                                            <asp:ListItem Text="₹1,00,00,000" Value="10000000" />
                                            <asp:ListItem Text="₹1.25 Crore" Value="12500000" />
                                            <asp:ListItem Text="₹1.5 Crore" Value="15000000" />
                                            <asp:ListItem Text="₹1.75 Crore" Value="17500000" />
                                            <asp:ListItem Text="₹2 Crore" Value="20000000" />
                                            <asp:ListItem Text="₹2.5 Crore" Value="25000000" />
                                            <asp:ListItem Text="₹3 Crore" Value="30000000" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="ddlPrice" InitialValue="" ErrorMessage="Price is required" CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-12 text-center mt-3">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary px-5" Text="Search Property" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section goto-here">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                    <span class="subheading">What we offer</span>
                    <h2 class="mb-2">Exclusive Offer For You</h2>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="rptDashboardProperties" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="property-wrap ftco-animate">
                                <div class="img d-flex align-items-center justify-content-center"
                                    style='<%# "background-image: url(" + Eval("Image1") + ");" %>'>
                                    <a href='<%# "Property_Single.aspx?id=" + Eval("PropertyID") %>'
                                        class="icon d-flex align-items-center justify-content-center btn-custom">
                                        <span class="ion-ios-link"></span>
                                    </a>
                                    <div class="list-agent d-flex align-items-center">
                                        <a href="#" class="agent-info d-flex align-items-center">
                                            <div class="img-2 rounded-circle"
                                                style='<%# "background-image: url(" + Eval("AgentImage") + ");" %>'>
                                            </div>
                                            <h3 class="mb-0 ml-2"><%# Eval("AgentName") %></h3>
                                        </a>
                                    </div>
                                </div>
                                <div class="text">
                                    <p class="price mb-3">
                                        <span class="old-price">₹<%# Eval("OldPrice") %></span>
                                        <span class="orig-price">₹<%# Eval("LatestPrice") %></span>
                                    </p>
                                    <h3 class="mb-0">
                                        <a href='<%# "Property_Single.aspx?id=" + Eval("PropertyID") %>'>
                                            <%# Eval("Title") %>
                                        </a>
                                    </h3>
                                    <span class="location d-inline-block mb-3">
                                        <i class="ion-ios-pin mr-2"></i><%# Eval("Location") %>
                                    </span>
                                    <ul class="property_list">
                                        <li><span class="flaticon-bed"></span><%# Eval("BHK") %> BHK</li>
                                        <li><span class="flaticon-bathtub"></span><%# Eval("Bathrooms") %> Bath</li>
                                        <li><span class="flaticon-floor-plan"></span><%# Eval("Area") %> sqft</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Centered Button -->
            <div class="row justify-content-center mt-4">
                <div class="col-auto">
                    <a href="properties.aspx" class="btn btn-primary btn-lg px-4 py-3">More Properties</a>
                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section ftco-fullwidth">
        <div class="overlay"></div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                    <span class="subheading">Services</span>
                    <h2 class="mb-2">Why Choose Us?</h2>
                </div>
            </div>
        </div>
        <div class="container-fluid px-0">
            <div class="row d-md-flex text-wrapper align-items-stretch">
                <div class="one-half mb-md-0 mb-4 img d-flex align-self-stretch" style="background-image: url('assets/Images/about.jpg');"></div>
                <div class="one-half half-text d-flex justify-content-end align-items-center">
                    <div class="text-inner pl-md-5">
                        <div class="row d-flex">
                            <div class="col-md-12 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services-wrap d-flex">
                                    <div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-piggy-bank"></span></div>
                                    <div class="media-body pl-4">
                                        <h3>No Downpayment</h3>
                                        <p>We offer zero downpayment options on select properties, making home ownership easier and more affordable for first-time buyers.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services-wrap d-flex">
                                    <div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-wallet"></span></div>
                                    <div class="media-body pl-4">
                                        <h3>Instant Cash Offers</h3>
                                        <p>Get fast, fair, and competitive cash offers for your property, with a smooth and hassle-free closing process.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services-wrap d-flex">
                                    <div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-file"></span></div>
                                    <div class="media-body pl-4">
                                        <h3>Trusted Local Experts</h3>
                                        <p>Our experienced real estate professionals know the Pune market inside-out and are dedicated to helping you make the best investment decisions.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services-wrap d-flex">
                                    <div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-locked"></span></div>
                                    <div class="media-body pl-4">
                                        <h3>Fixed Pricing Guarantee</h3>
                                        <p>We offer transparent pricing with no hidden costs, ensuring you lock in the best deal without surprises.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-counter ftco-section img" id="section-counter">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text text-border d-flex align-items-center">
                            <strong class="number" data-number="305">0</strong>
                            <span>Area
                              <br>
                                Population</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text text-border d-flex align-items-center">
                            <strong class="number" data-number="1090">0</strong>
                            <span>Total
                              <br>
                                Properties</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text text-border d-flex align-items-center">
                            <strong class="number" data-number="209">0</strong>
                            <span>Average
                              <br>
                                House</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text d-flex align-items-center">
                            <strong class="number" data-number="67">0</strong>
                            <span>Total
                              <br>
                                Branches</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                    <span class="subheading">Find Properties</span>
                    <h2 class="mb-2">Find Properties In Your City</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="listing-wrap img rounded d-flex align-items-end" style="background-image: url(assets/Images/listing-1.jpg);">
                        <div class="location">
                            <span class="rounded">Koregaon Park, Pune</span>
                        </div>
                        <div class="text">
                            <h3><a href="#">120 Property Listing</a></h3>
                            <a href="#" class="btn-link">See All Listing <span class="ion-ios-arrow-round-forward"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="listing-wrap img rounded d-flex align-items-end" style="background-image: url(assets/Images/listing-2.jpg);">
                        <div class="location">
                            <span class="rounded">Wakad, Pune</span>
                        </div>
                        <div class="text">
                            <h3><a href="#">250 Property Listing</a></h3>
                            <a href="#" class="btn-link">See All Listing <span class="ion-ios-arrow-round-forward"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="listing-wrap img rounded d-flex align-items-end" style="background-image: url(assets/Images/listing-3.jpg);">
                        <div class="location">
                            <span class="rounded">Bavdhan, Pune</span>
                        </div>
                        <div class="text">
                            <h3><a href="#">180 Property Listing</a></h3>
                            <a href="#" class="btn-link">See All Listing <span class="ion-ios-arrow-round-forward"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="listing-wrap img rounded d-flex align-items-end" style="background-image: url(assets/Images/listing-4.jpg);">
                        <div class="location">
                            <span class="rounded">Hinjewadi, Pune</span>
                        </div>
                        <div class="text">
                            <h3><a href="#">150 Property Listing</a></h3>
                            <a href="#" class="btn-link">See All Listing <span class="ion-ios-arrow-round-forward"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="listing-wrap img rounded d-flex align-items-end" style="background-image: url(assets/Images/listing-5.jpg);">
                        <div class="location">
                            <span class="rounded">Katraj, Pune</span>
                        </div>
                        <div class="text">
                            <h3><a href="#">200 Property Listing</a></h3>
                            <a href="#" class="btn-link">See All Listing <span class="ion-ios-arrow-round-forward"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="listing-wrap img rounded d-flex align-items-end" style="background-image: url(assets/Images/listing-6.jpg);">
                        <div class="location">
                            <span class="rounded">Kharadi, Pune</span>
                        </div>
                        <div class="text">
                            <h3><a href="#">140 Property Listing</a></h3>
                            <a href="#" class="btn-link">See All Listing <span class="ion-ios-arrow-round-forward"></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section testimony-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 text-center heading-section ftco-animate">
                    <span class="subheading">Testimonial</span>
                    <h2 class="mb-3">Happy Clients</h2>
                </div>
            </div>
            <div class="row ftco-animate">
                <div class="col-md-12">
                    <div class="carousel-testimony owl-carousel ftco-owl">
                        <div class="item">
                            <div class="testimony-wrap py-4">
                                <div class="text">
                                    <p class="mb-4">I was looking for a reliable property dealer in Pune, and Rainbow Housing exceeded expectations with their service, clarity, and timely updates throughout the purchase process.</p>
                                    <div class="d-flex align-items-center">
                                        <div class="user-img" style="background-image: url(assets/Images/person_1.jpg)"></div>
                                        <div class="pl-3">
                                            <p class="name">Ravi Kulkarni</p>
                                            <span class="position">Happy Client</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap py-4">
                                <div class="text">
                                    <p class="mb-4">Finding the right flat in Pune felt hard, but with their team’s help, the process was simple, fast, and genuinely customer-focused. Highly recommended!</p>
                                    <div class="d-flex align-items-center">
                                        <div class="user-img" style="background-image: url(assets/Images/person_2.jpg)"></div>
                                        <div class="pl-3">
                                            <p class="name">Sachin Patil</p>
                                            <span class="position">Happy Client</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap py-4">
                                <div class="text">
                                    <p class="mb-4">Their guidance helped me book a 2BHK in Kharadi without hassle. The team is friendly, responsive, and knowledgeable about every aspect of the market.</p>
                                    <div class="d-flex align-items-center">
                                        <div class="user-img" style="background-image: url(assets/Images/person_4.jpg)"></div>
                                        <div class="pl-3">
                                            <p class="name">Akshay Mehta</p>
                                            <span class="position">Happy Client</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap py-4">
                                <div class="text">
                                    <p class="mb-4">Their local knowledge and helpful team made my investment journey stress-free. I was impressed with their dedication and the quality of projects they recommended.</p>
                                    <div class="d-flex align-items-center">
                                        <div class="user-img" style="background-image: url(assets/Images/person_3.jpg)"></div>
                                        <div class="pl-3">
                                            <p class="name">Amit Jadhav</p>
                                            <span class="position">Happy Client</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap py-4">
                                <div class="text">
                                    <p class="mb-4">I had a great experience purchasing my first home. They kept everything smooth and easy, and I truly appreciate their honest and quick communication.</p>
                                    <div class="d-flex align-items-center">
                                        <div class="user-img" style="background-image: url(assets/Images/person_5.jpg)"></div>
                                        <div class="pl-3">
                                            <p class="name">Tarush Joshi</p>
                                            <span class="position">Happy Client</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-agent">
        <div class="container">
            <div class="row justify-content-center pb-5">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Agents</span>
                    <h2 class="mb-4">Our Agents</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 ftco-animate">
                    <div class="agent">
                        <div class="img">
                            <img src="assets/Images/team-1.jpg" class="img-fluid" alt="Colorlib Template">
                        </div>
                        <div class="desc">
                            <h3><a href="properties.aspx">Om Bhoge</a></h3>
                            <p class="h-info"><span class="ion-ios-filing icon"></span><span class="details">43 Properties</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 ftco-animate">
                    <div class="agent">
                        <div class="img">
                            <img src="assets/Images/team-2.jpg" class="img-fluid" alt="Colorlib Template">
                        </div>
                        <div class="desc">
                            <h3><a href="properties.aspx">Rahul Sharma</a></h3>
                            <p class="h-info"><span class="ion-ios-filing icon"></span><span class="details">28 Properties</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 ftco-animate">
                    <div class="agent">
                        <div class="img">
                            <img src="assets/Images/team-3.jpg" class="img-fluid" alt="Colorlib Template">
                        </div>
                        <div class="desc">
                            <h3><a href="properties.aspx">Priya Mehta</a></h3>
                            <p class="h-info"><span class="ion-ios-filing icon"></span><span class="details">30 Properties</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 ftco-animate">
                    <div class="agent">
                        <div class="img">
                            <img src="assets/Images/team-4.jpg" class="img-fluid" alt="Colorlib Template">
                        </div>
                        <div class="desc">
                            <h3><a href="properties.aspx">Arjun Deshmukh</a></h3>
                            <p class="h-info"><span class="ion-ios-filing icon"></span><span class="details">25 Properties</span></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Centered Button -->
            <div class="row mt-4">
                <div class="col text-center">
                    <a href="agent.aspx" class="btn btn-primary btn-lg px-4 py-2">More Agents</a>
                </div>
            </div>
        </div>
    </section>



    <section class="ftco-section ftco-no-pt">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <span class="subheading">Blog</span>
                    <h2>Recent Blog</h2>
                </div>
            </div>
            <div class="row d-flex">
                <div class="col-md-3 d-flex ftco-animate">
                    <div class="blog-entry justify-content-end">
                        <div class="text">
                            <a href="blog_single.aspx" class="block-20 img" style="background-image: url('assets/Images/image_1.jpg');"></a>
                            <h3 class="heading"><a href="#">Top 5 Locations to Buy Property in Pune in 2025</a></h3>
                            <div class="meta mb-3">
                                <div><a href="#">July 15, 2025</a></div>
                                <div><a href="#">Admin</a></div>
                                <div><a href="#" class="meta-chat"><span class="icon-chat"></span>5</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex ftco-animate">
                    <div class="blog-entry justify-content-end">
                        <div class="text">
                            <a href="blog_single.aspx" class="block-20 img" style="background-image: url('assets/Images/image_2.jpg');"></a>
                            <h3 class="heading"><a href="#">How to Invest in Real Estate with Low Risk</a></h3>
                            <div class="meta mb-3">
                                <div><a href="#">June 20, 2025</a></div>
                                <div><a href="#">Admin</a></div>
                                <div><a href="#" class="meta-chat"><span class="icon-chat"></span>3</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex ftco-animate">
                    <div class="blog-entry justify-content-end">
                        <div class="text">
                            <a href="blog_single.aspx" class="block-20 img" style="background-image: url('assets/Images/image_3.jpg');"></a>
                            <h3 class="heading"><a href="#">Understanding RERA Before Buying Property</a></h3>
                            <div class="meta mb-3">
                                <div><a href="#">May 28, 2025</a></div>
                                <div><a href="#">Admin</a></div>
                                <div><a href="#" class="meta-chat"><span class="icon-chat"></span>2</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex ftco-animate">
                    <div class="blog-entry justify-content-end">
                        <div class="text">
                            <a href="blog_single.aspx" class="block-20 img" style="background-image: url('assets/Images/image_4.jpg');"></a>
                            <h3 class="heading"><a href="#">Why 2025 is a Great Year to Buy a Home in India</a></h3>
                            <div class="meta mb-3">
                                <div><a href="#">April 10, 2025</a></div>
                                <div><a href="#">Admin</a></div>
                                <div><a href="#" class="meta-chat"><span class="icon-chat"></span>4</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
