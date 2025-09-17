<%@ Page Title="RainbowHosing-Services" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="RealEstateProject_New.Serivices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Hero Section -->
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('assets/Images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="overlay-2"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
                    <h1 class="mb-3 bread">Services</h1>
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="Home.aspx">Home <i class="ion-ios-arrow-forward"></i></a></span>
                        <span>Services <i class="ion-ios-arrow-forward"></i></span>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                    <span class="subheading">Our Services</span>
                    <h2 class="mb-2">Choose Our Services</h2>
                </div>
            </div>

            <div class="row d-flex">
                <!-- Legal Assistance -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-gavel fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Legal Assistance</h3>
                            <p>We provide legal support for property documentation, registration, and verification to ensure secure transactions.</p>
                        </div>
                    </div>
                </div>

                <!-- Home Loan Support -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-hand-holding-usd fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Home Loan Support</h3>
                            <p>We connect you with top banks and help you get the best loan offers tailored to your home buying needs.</p>
                        </div>
                    </div>
                </div>

                <!-- Rental & Leasing -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-file-signature fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Rental & Leasing</h3>
                            <p>Our team handles all rental and lease agreements for homes and commercial spaces quickly and legally.</p>
                        </div>
                    </div>
                </div>

                <!-- Property Management -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-tools fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Property Management</h3>
                            <p>We manage your property—maintenance, tenant support, and rent collection—professionally and efficiently.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Second Row of Services -->
            <div class="row d-flex mt-4">
                <!-- Consultancy -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-user-tie fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Consultancy</h3>
                            <p>Our experts guide you with tailored property solutions to match your budget and lifestyle.</p>
                        </div>
                    </div>
                </div>

                <!-- Investment Advisory -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-chart-line fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Investment Advisory</h3>
                            <p>Maximize your returns with professional insights on property investments in prime locations.</p>
                        </div>
                    </div>
                </div>

                <!-- NRI Services -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-globe fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>NRI Services</h3>
                            <p>From property management to investments, we assist NRIs with end-to-end services in India.</p>
                        </div>
                    </div>
                </div>

                <!-- Site Visit Assistance -->
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <i class="fas fa-bus fa-2x"></i>
                        </div>
                        <div class="media-body py-md-4">
                            <h3>Site Visit Assistance</h3>
                            <p>We arrange guided site visits with transport support to make your property search seamless.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
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
                <div class="one-half img d-flex align-self-stretch" style="background-image: url('assets/Images/about.jpg');"></div>
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

    <!-- Counter Section -->
    <section class="ftco-counter ftco-section img" id="section-counter">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text text-border d-flex align-items-center">
                            <strong class="number" data-number="305">0</strong>
                            <span>Area<br>Population</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text text-border d-flex align-items-center">
                            <strong class="number" data-number="1090">0</strong>
                            <span>Total<br>Properties</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text text-border d-flex align-items-center">
                            <strong class="number" data-number="209">0</strong>
                            <span>Average<br>House</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                    <div class="block-18">
                        <div class="text d-flex align-items-center">
                            <strong class="number" data-number="67">0</strong>
                            <span>Total<br>Branches</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
