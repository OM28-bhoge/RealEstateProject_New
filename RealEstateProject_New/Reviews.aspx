<%@ Page Title="RainbowHosing-Reviews" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="RealEstateProject_New.Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/review.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="reviews-section">
        <div class="container">
            <!-- Heading -->
            <div class="reviews-heading">
                <h2>Happy Clients</h2>
                <span>What our customers say about RainbowHousing</span>
            </div>

            <!-- 25 Reviews -->
            <div class="review-card">
                <p class="review-text">I was looking for a reliable property dealer in Pune, and Rainbow Housing exceeded expectations with their service, clarity, and timely updates throughout the purchase process.</p>
                <div class="review-user">
                    <div class="review-user-img" style="background-image: url(assets/Images/person_1.jpg)"></div>
                    <div>
                        <p class="name">Ravi Kulkarni</p>
                        <span class="position">Happy Client</span>
                    </div>
                </div>
            </div>

            <div class="review-card">
                <p class="review-text">Finding the right flat in Pune felt hard, but with their team’s help, the process was simple, fast, and genuinely customer-focused. Highly recommended!</p>
                <div class="review-user">
                    <div class="review-user-img" style="background-image: url(assets/Images/person_2.jpg)"></div>
                    <div>
                        <p class="name">Sachin Patil</p>
                        <span class="position">Happy Client</span>
                    </div>
                </div>
            </div>

            <div class="review-card">
                <p class="review-text">Their guidance helped me book a 2BHK in Kharadi without hassle. The team is friendly, responsive, and knowledgeable about every aspect of the market.</p>
                <div class="review-user">
                    <div class="review-user-img" style="background-image: url(assets/Images/person_4.jpg)"></div>
                    <div>
                        <p class="name">Akshay Mehta</p>
                        <span class="position">Happy Client</span>
                    </div>
                </div>
            </div>

            <div class="review-card">
                <p class="review-text">Their local knowledge and helpful team made my investment journey stress-free. I was impressed with their dedication and the quality of projects they recommended.</p>
                <div class="review-user">
                    <div class="review-user-img" style="background-image: url(assets/Images/person_3.jpg)"></div>
                    <div>
                        <p class="name">Amit Jadhav</p>
                        <span class="position">Happy Client</span>
                    </div>
                </div>
            </div>

            <div class="review-card">
                <p class="review-text">I had a great experience purchasing my first home. They kept everything smooth and easy, and I truly appreciate their honest and quick communication.</p>
                <div class="review-user">
                    <div class="review-user-img" style="background-image: url(assets/Images/person_5.jpg)"></div>
                    <div>
                        <p class="name">Tarush Joshi</p>
                        <span class="position">Happy Client</span>
                    </div>
                </div>
            </div>

            <!-- More sample reviews (6–25) -->
            <% 
                string[] names = { "Neha Sharma", "Vikas Deshmukh", "Rohit Nair", "Priya Menon", "Kunal Singh", "Anjali Patwardhan", "Siddharth Rao", "Deepa Joshi", "Rajesh Kapoor", "Meena Iyer", "Vivek Rane", "Swati Chavan", "Gaurav Kulkarni", "Manisha Shah", "Harish Malhotra", "Divya Shinde", "Nitin Bhosale", "Pooja Agarwal", "Arjun Khanna", "Sneha Pawar" };
                string[] reviews = {
                    "RainbowHousing made buying my dream home stress-free. Great service and constant updates.",
                    "The entire process was smooth and professional. They care for their clients genuinely.",
                    "Very transparent team. I loved the clarity they provided while booking my flat.",
                    "Excellent after-sales service. They helped me with all paperwork and bank formalities.",
                    "I got my 3BHK in Baner at a great price thanks to their market knowledge.",
                    "Very professional approach, and they always pick up calls promptly.",
                    "I strongly recommend them to anyone looking to buy or invest in Pune real estate.",
                    "They provided multiple options, explained pros & cons clearly, and guided me well.",
                    "RainbowHousing understands the market deeply. Their suggestions were perfect for me.",
                    "They are trustworthy and reliable. I was fully satisfied with my purchase.",
                    "The team is extremely cooperative and friendly. Made the entire process easy.",
                    "Their legal guidance during my property registration was excellent.",
                    "I got timely possession without any hidden charges. Very happy client!",
                    "Fantastic property recommendations and very courteous staff.",
                    "I am impressed by their professionalism and dedication.",
                    "They kept me updated at every step of the purchase.",
                    "Very responsive and helped me get the best deal in Hinjewadi.",
                    "Great service for first-time home buyers like me.",
                    "Professional, ethical, and transparent in all dealings.",
                    "My best property buying experience so far."
                };

                for (int i = 0; i < names.Length; i++) {
            %>
                <div class="review-card">
                    <p class="review-text"><%= reviews[i] %></p>
                    <div class="review-user">
                        <div class="review-user-img" style="background-image: url(assets/Images/person_<%= (i % 5) + 1 %>.jpg)"></div>
                        <div>
                            <p class="name"><%= names[i] %></p>
                            <span class="position">Happy Client</span>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
