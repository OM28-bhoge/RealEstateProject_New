<%@ Page Title="Career Applications" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CareerApplications.aspx.cs" Inherits="RealEstateProject_New.CareerApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/adminstyle.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">
        <!-- Page Title -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold text-dark">
                <i class="fa fa-briefcase text-primary me-2"></i>Career Applications
            </h3>
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard"
                CssClass="btn btn-secondary btn-sm" PostBackUrl="~/Admindashboard.aspx" />
        </div>

        <!-- Applications Table -->
        <div class="card shadow-sm rounded-3">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fa fa-briefcase me-2"></i>Career Applications</h5>
                <span class="badge bg-light text-dark">Manage Applicants</span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <asp:GridView ID="gvApplications" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover table-bordered mb-0 align-middle"
                        GridLines="None"
                        OnRowCommand="gvApplications_RowCommand"
                        DataKeyNames="ApplicationID"
                        PagerStyle-CssClass="pagination justify-content-center">
                        <Columns>
                            <asp:BoundField DataField="ApplicationID" HeaderText="ID" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="Position" HeaderText="Position" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />

                            <asp:TemplateField HeaderText="Resume">
                                <ItemTemplate>
                                    <a href='<%# ResolveUrl("~/Uploads/Resumes/") + Eval("ResumePath") %>' target="_blank"
                                        class="btn btn-sm btn-outline-primary">
                                        <i class="fa fa-file-pdf"></i> View
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <%# Eval("Status").ToString() == "Accepted" 
                                        ? "<span class='badge bg-success'>Accepted</span>" 
                                        : "<span class='badge bg-warning text-dark'>Pending</span>" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnAccept" runat="server" Text="Accept"
                                        CssClass="btn btn-success btn-sm me-1"
                                        CommandName="Accept" CommandArgument='<%# Eval("ApplicationID") %>'
                                        Visible='<%# Eval("Status").ToString() != "Accepted" %>' />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete"
                                        CssClass="btn btn-danger btn-sm"
                                        CommandName="Delete" CommandArgument='<%# Eval("ApplicationID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
