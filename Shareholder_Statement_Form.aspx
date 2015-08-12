<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Shareholder_Statement_Form.aspx.cs" Inherits="Shareholder_Statement_Form" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Shareholder Statement</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Shareholder Statement</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Select Company Name</label>
        </div>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddCompanyName" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_Company_List" DataTextField="Company_Name" DataValueField="Company_ID" AutoPostBack="True" OnDataBound="ddCompanyName_DataBound" OnSelectedIndexChanged="ddCompanyName_SelectedIndexChanged"></asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSource_Company_List" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT DISTINCT [Company ID] AS Company_ID, [Company Name] AS Company_Name FROM [view_Shareholder_Statement]"></asp:SqlDataSource>
        </div>
        <div class="col-sm-3"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Select Shareholder Name</label>
        </div>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddShareholderName" CssClass="form-control" runat="server"></asp:DropDownList>

        </div>
        <div class="col-sm-3"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            
        </div>
        <div class="col-sm-6">
            <asp:Button ID="btnStatement" CssClass="btn btn-primary btn-block" Text="Generate Statement" runat="server" OnClick="btnReport_Click"></asp:Button>

        </div>
        <div class="col-sm-3"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            
        </div>
        <div class="col-sm-6">
            <asp:Label ID="lblOutput" CssClass="center-block" runat="server"></asp:Label>

        </div>
        <div class="col-sm-3"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-12">
           
        </div>
        
    </div>
</asp:Content>

