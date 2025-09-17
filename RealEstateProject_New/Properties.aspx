<%@ Page Title="RainbowHousing-Properties" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Properties.aspx.cs" Inherits="RealEstateProject_New.Properties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .property-wrap .img {
            position: relative;
            overflow: hidden;
        }

            .property-wrap .img .icon {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                opacity: 0;
                transition: all 0.3s ease;
                background: rgba(0,0,0,0.5);
                border-radius: 50%;
                width: 60px;
                height: 60px;
            }

            .property-wrap .img:hover .icon {
                opacity: 1;
            }

            .property-wrap .img .list-agent {
                position: absolute;
                bottom: 10px;
                left: 10px;
                background: rgba(0,0,0,0.3);
                padding: 5px 10px;
                border-radius: 30px;
            }

                .property-wrap .img .list-agent .agent-info h3 {
                    margin: 0;
                    font-size: 14px;
                    color: #fff;
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Hero Section -->
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight"
        style="background-image: url('assets/Images/bg_1.jpg');"
        data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="overlay-2"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
                    <h1 class="mb-3 bread">Properties</h1>
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="Home.aspx">Home <i class="ion-ios-arrow-forward"></i></a></span>
                        <span>Properties <i class="ion-ios-arrow-forward"></i></span>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Properties Section -->
    <section class="ftco-section goto-here">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptProperties" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="property-wrap ftco-animate">

                                <!-- Property Image -->
                                <div class="img d-flex align-items-center justify-content-center position-relative"
                                    style="<%# GetImageStyle(Eval("Image1")) %>">

                                    <!-- Hover link icon -->
                                    <a href='<%# "Property_Single.aspx?id=" + Eval("PropertyID") %>'
                                        class="icon d-flex align-items-center justify-content-center btn-custom">
                                        <span class="ion-ios-link" style="font-size: 30px; color: #fff;"></span>
                                    </a>

                                    <!-- Agent Info -->
                                    <div class="list-agent d-flex align-items-center position-absolute">
                                        <a href="#" class="agent-info d-flex align-items-center">
                                            <div class="img-2 rounded-circle"
                                                style="<%# GetAgentImageStyle(Eval("AgentImage")) %>">
                                            </div>
                                            <h3 class="mb-0 ml-2" style="color: #fff; text-shadow: 1px 1px 3px rgba(0,0,0,0.7);">
                                                <%# Eval("AgentName") %>
                                            </h3>
                                        </a>
                                    </div>
                                </div>

                                <!-- Property Details -->
                                <div class="text mt-2">
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


                <!-- Message if no properties found -->
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </section>

</asp:Content>
