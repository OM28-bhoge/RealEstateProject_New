<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TotalContacts.aspx.cs" Inherits="RealEstateProject_New.TotalContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/adminstyle.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">
        <!-- Page Title -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold text-dark">
                <i class="fa fa-address-book text-primary me-2"></i>Total Contact Requests
            </h3>
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard"
                CssClass="btn btn-secondary btn-sm" PostBackUrl="~/Admindashboard.aspx" />
        </div>

        <!-- Contacts Table -->
        <div class="card shadow-sm rounded-3">
            <div class="card-header bg-info text-white">
                <h5 class="mb-0"><i class="fa fa-address-book me-2"></i>Contact Records</h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <asp:GridView ID="gvContacts" runat="server"
                        CssClass="table table-striped table-hover table-bordered mb-0"
                        AutoGenerateColumns="False" GridLines="None"
                        AllowPaging="true" PageSize="10"
                        PagerStyle-CssClass="pagination justify-content-center mt-3"
                        DataKeyNames="Id"
                        OnPageIndexChanging="gvContacts_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="EmailId" HeaderText="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />
                            <asp:BoundField DataField="Message" HeaderText="Message" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Date" 
                                DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" 
                                HtmlEncode="False" ItemStyle-CssClass="text-center" />
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
