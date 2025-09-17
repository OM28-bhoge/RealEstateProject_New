<%@ Page Title="RainbowHousing - Careers" Language="C#" MasterPageFile="~/UserIndex.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="RealEstateProject_New.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/career.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Careers Info Section -->
    <section class="container py-5">
        <div class="row align-items-center">
            <div class="col-12 text-center mb-4">
                <h1 class="display-4 fw-bold">Join Our Team</h1>
                <p class="lead">Be part of RainbowHousing and shape the future of real estate</p>
            </div>

            <div class="col-md-6">
                <h2 class="fw-bold">Why Work With Us?</h2>
                <p>RainbowHousing is a leading real estate company committed to innovation and customer satisfaction. Join our dynamic team and build your career in a supportive and growth-focused environment.</p>
                <ul>
                    <li>Professional growth opportunities</li>
                    <li>Collaborative and innovative work culture</li>
                    <li>Attractive benefits and compensation</li>
                    <li>Flexible working environment</li>
                </ul>
            </div>
            <div class="col-md-6 text-center">
                <img src="assets/images/team-work.jpg" alt="Team Work" class="img-fluid rounded shadow" />
            </div>
        </div>
    </section>

    <!-- Current Openings Section -->
    <section class="container py-5">
        <h2 class="fw-bold mb-4">Current Openings</h2>
        <div class="table-responsive">
            <asp:GridView ID="gvCareers" runat="server" CssClass="table table-striped table-hover"
                AutoGenerateColumns="False" GridLines="None" AllowPaging="true" PageSize="10"
                OnPageIndexChanging="gvCareers_PageIndexChanging" DataKeyNames="CareerID">
                <Columns>
                    <asp:BoundField DataField="Position" HeaderText="Position" />
                    <asp:BoundField DataField="Department" HeaderText="Department" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="Experience" HeaderText="Experience Required" />
                    <asp:TemplateField HeaderText="Apply">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlApply" runat="server" 
                                Text="Apply Now" CssClass="btn btn-primary btn-sm"
                                NavigateUrl='<%# "CareerApply.aspx?position=" + Eval("Position") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center p-3">No career openings available at the moment.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
