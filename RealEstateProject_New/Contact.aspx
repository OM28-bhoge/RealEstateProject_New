<%@ Page Title="RainbowHosing-Contact" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RealEstateProject_New.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('assets/Images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="overlay-2"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
                    <h1 class="mb-3 bread">Contact Us</h1>
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="Home.aspx">Home <i class="ion-ios-arrow-forward"></i></a></span>
                        <span>Contact <i class="ion-ios-arrow-forward"></i></span>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section contact-section">
        <div class="container">
            <div class="row d-flex mb-5 contact-info justify-content-center">
                <div class="col-md-8">
                    <div class="row mb-5">
                        <div class="col-md-4 text-center py-4">
                            <div class="icon mb-3 d-flex align-items-center justify-content-center">
                                <span class="icon-map-o"></span>
                            </div>
                            <p>
                                <strong>Address:</strong><br>
                                Office No - 206, RealEstate Park, Pune
                            </p>
                        </div>
                        <div class="col-md-4 text-center py-4">
                            <div class="icon mb-3 d-flex align-items-center justify-content-center">
                                <span class="icon-mobile-phone"></span>
                            </div>
                            <p>
                                <strong>Phone:</strong><br>
                                <a href="tel://1234567920">+91 7777659999</a>
                            </p>
                        </div>
                        <div class="col-md-4 text-center py-4">
                            <div class="icon mb-3 d-flex align-items-center justify-content-center">
                                <span class="icon-envelope-o"></span>
                            </div>
                            <p>
                                <strong>Email:</strong><br>
                                <a href="mailto:info@rainbowhousing.com">info@rainbowhousing.com</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row block-9 justify-content-center mb-5">
                <!-- Map Column -->
                <div class="col-md-6 d-flex align-items-stretch">
                    <div class="map-container w-100 h-100">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.391591738878!2d73.85674287509578!3d18.56027316905913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c07044e8a7e1%3A0x2d58b2f1c2e8f4b2!2sPune%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1659977533711!5m2!1sen!2sin"
                            width="100%"
                            height="100%"
                            style="border: 0;"
                            allowfullscreen=""
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <!-- Form Column -->
                <div class="col-md-6 d-flex align-items-stretch">
                    <form action="#" class="bg-light p-5 contact-form w-100">
                        <!-- Name -->
                        <div class="form-group mx-2 mb-2">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="*Name required" ForeColor="Red" Display="Dynamic" />
                        </div>

                        <!-- Email -->
                        <div class="form-group mx-2 mb-2">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Email required" ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Invalid Email Format" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ForeColor="Red" Display="Dynamic" />
                        </div>

                        <!-- Phone -->
                        <div class="form-group mx-2 mb-2">
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="*Phone required" ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="*Invalid Phone" ValidationExpression="^[6-9]\d{9}$" ForeColor="Red" Display="Dynamic" />
                        </div>
                        <!-- Subject -->
                        <div class="form-group mx-2 mb-2">
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="*Subject required" ForeColor="Red" Display="Dynamic" />
                        </div>

                        <!-- Message -->
                        <div class="form-group mx-2 mb-2">
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Message"></asp:TextBox>
                        </div>

                        <!-- Submit Button -->
                        <div class="form-group mb-0">
                            <asp:Button ID="btnSubmit" runat="server"
                                CssClass="btn btn-primary py-3 px-5 w-100"
                                Text="Send Message"
                                OnClick="btnsave_Click" />
                        </div>
                        <div>
                            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </section>
</asp:Content>
