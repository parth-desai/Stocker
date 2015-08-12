<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Share_Certificate_Generation_Form.aspx.cs" Inherits="Share_Certificate_Generation_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Share Certificate</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    <h2> Share Certificate Generation</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" Runat="Server">
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Company Name</label>
        </div>
        <div class="col-sm-7">
            <asp:DropDownList ID="ddlCompanyName" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_for_Company_Name" DataTextField="Comp_Name" DataValueField="Comp_Id" OnDataBound="ddlCompanyName_DataBound" OnSelectedIndexChanged="ddlCompanyName_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_for_Company_Name" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT DISTINCT [Comp_Id], [Comp_Name] FROM [Complist]"></asp:SqlDataSource>
        </div>
        <div class="col-sm-2">

        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Shareholder Name</label>
        </div>
        <div class="col-sm-7">
            <asp:DropDownList ID="ddlShareholderName" CssClass="form-control" runat="server" Enabled="false" OnDataBound="ddlShareholderName_DataBound"></asp:DropDownList>
        </div>
        <div class="col-sm-2">

        </div>
    </div>
    
    <div class="form-group">
        <div class="col-sm-2">
           
        </div>
        <div class="col-sm-4">
            <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-primary btn-block" Text="Generate" OnClick="btnGenerate_Click" />
            </div>
          <div class="col-sm-4">
            <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-primary btn-block" Text="Print" OnClick="btnGenerate_Click" />
            </div>  
        <div class="col-sm-2">
            
        </div>
    </div>
    <div>
        <iframe runat="server" id="pdfviewer" width="100%" height="800px" visible="false"></iframe>
    </div>
    
</asp:Content>

