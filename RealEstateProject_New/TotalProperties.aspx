<%@ Page Title="RainbowHosing-(Admin)TotalProperties" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TotalProperties.aspx.cs" Inherits="RealEstateProject_New.TotalProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/adminstyle.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">
        <!-- Page Title -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold text-dark">
                <i class="fa fa-building text-primary me-2"></i>Properties
            </h3>
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" 
                CssClass="btn btn-secondary btn-sm" PostBackUrl="~/Admindashboard.aspx" />
        </div>

        <!-- Properties Table -->
        <div class="card shadow-sm rounded-3">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0"><i class="fa fa-building me-2"></i>Properties</h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <asp:GridView ID="gvProperties" runat="server"
                        CssClass="table table-striped table-hover table-bordered mb-0"
                        AutoGenerateColumns="False" GridLines="None"
                        AllowPaging="true" PageSize="10"
                        PagerStyle-CssClass="pagination justify-content-center mt-3"
                        DataKeyNames="PropertyID"
                        OnRowCommand="gvProperties_RowCommand"
                        OnPageIndexChanging="gvProperties_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="PropertyID" HeaderText="ID" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="Title" HeaderText="Property Name" />
                            <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                            <asp:BoundField DataField="SalePrice" HeaderText="Sale Price" DataFormatString="{0:C}" ItemStyle-CssClass="text-end" />
                            <asp:BoundField DataField="RentPrice" HeaderText="Rent Price" DataFormatString="{0:C}" ItemStyle-CssClass="text-end" />
                            <asp:BoundField DataField="BHK" HeaderText="BHK" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="Area" HeaderText="Area (sq.ft)" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="City" HeaderText="City" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Listed On" 
                                DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" HtmlEncode="False" ItemStyle-CssClass="text-center" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnDeleteProperty" runat="server" Text="Delete"
                                        CommandName="DeleteProperty"
                                        CommandArgument='<%# Eval("PropertyID") %>'
                                        CssClass="btn btn-danger btn-sm"
                                        OnClientClick="return confirm('Are you sure you want to delete this property?');" />
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
