<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Dashboard_News.aspx.cs" Inherits="Dashboard_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Add News</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    <h2>Add News To Dashboard</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" Runat="Server">


    <div class="form-group">
        <div class="col-sm-2">
            <label class="control-label">Company Name:</label>
        </div>
        <div class="col-sm-7">
            <asp:DropDownList ID="ddlCompanyName" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_Company_Name" DataTextField="Comp_Name" DataValueField="Comp_Id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource_Company_Name" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT DISTINCT [Comp_Id], [Comp_Name] FROM [Complist]"></asp:SqlDataSource>
        </div>
        <div class="col-sm-3"></div>
    </div>

    <div class="form-group">
        <div class="col-sm-2">
            <label class="control-label">News:</label>
        </div>
        <div class="col-sm-7">
            <asp:TextBox runat="server" ID="txtNews" CssClass="form-control" Text=""></asp:TextBox>
        </div>
        <div class="col-sm-3"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-2">
            
        </div>
        <div class="col-sm-7">
            <asp:Button runat="server" ID="TextBox1" CssClass="btn btn-primary" Text="Add News" OnClick="btn_Click"></asp:Button>
        </div>
        <div class="col-sm-3"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-2">
            
        </div>
        <div class="col-sm-7">
            <asp:Label runat="server" ID="lblOutput" CssClass="bg-primary"></asp:Label>
        </div>
        <div class="col-sm-3"></div>
    </div>

</asp:Content>

