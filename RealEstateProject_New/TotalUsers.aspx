<%@ Page Title="RainbowHosing-(Admin)TotalUsers" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TotalUsers.aspx.cs" Inherits="RealEstateProject_New.TotalUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/adminstyle.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">
        <!-- Page Title -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold text-dark">
                <i class="fa fa-users text-primary me-2"></i>Registered Users
            </h3>
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" 
                CssClass="btn btn-secondary btn-sm" PostBackUrl="~/Admindashboard.aspx" />
        </div>

        <!-- Users Table -->
        <div class="card shadow-sm rounded-3">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="fa fa-users me-2"></i>Registered Users</h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <asp:GridView ID="gvUsers" runat="server"
                        CssClass="table table-striped table-hover table-bordered mb-0"
                        AutoGenerateColumns="False" GridLines="None"
                        AllowPaging="true" PageSize="10"
                        PagerStyle-CssClass="pagination justify-content-center mt-3"
                        DataKeyNames="UserID"
                        OnRowCommand="gvUsers_RowCommand"
                        OnPageIndexChanging="gvUsers_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="UserID" HeaderText="ID" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Role" HeaderText="Role" />
                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                            <asp:BoundField DataField="CountryCode" HeaderText="Country Code" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="City" HeaderText="City" />
                            <asp:BoundField DataField="State" HeaderText="State" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Registered On" 
                                DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" HtmlEncode="False" ItemStyle-CssClass="text-center" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnDeleteUser" runat="server" Text="Delete"
                                        CommandName="DeleteUser"
                                        CommandArgument='<%# Eval("UserID") %>'
                                        CssClass="btn btn-danger btn-sm"
                                        OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination justify-content-center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
