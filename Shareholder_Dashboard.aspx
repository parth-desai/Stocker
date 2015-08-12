<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Shareholder_Dashboard.aspx.cs" Inherits="Shareholder_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Dashboard</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">

    <div class="row">
        <h3 style="padding-left:20px">Your Portfolio
        </h3>

    </div>
    <div class="row">
        <h5 style="padding-left:20px">You have invested in following companies:</h5>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="GridViewPortfolio" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewPortfolio_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Company Name:</label>
        </div>
        <div class="col-sm-3">
            <asp:TextBox CssClass="form-control" ID="txtCompanyName" runat="server" Enabled="false"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <label class="control-label">Shares in Hand</label>
        </div>
        <div class="col-sm-3">
            <asp:TextBox CssClass="form-control" ID="txtQuantityhand" runat="server" Enabled="false"></asp:TextBox>
        </div>

    </div>
    <div class="form-group">

        <div class="col-sm-3">
            <label class="control-label">Current Value Of Shares</label>
        </div>
        <div class="col-sm-3">
            <asp:TextBox CssClass="form-control" ID="txtCurrentValue" runat="server" Enabled="false"></asp:TextBox>
        </div>
       
        <div class="col-sm-3">
            <label class="control-label">Profit/Loss</label>
        </div>
        <div class="col-sm-3">
            <asp:TextBox CssClass="form-control" ID="txtProfitLoss" runat="server" Enabled="false"></asp:TextBox>
        </div>

    </div>
    <div class="row">
        <div class="col-sm-3">
            <label class="control-label"></label>
        </div>
        <div class="col-sm-3">
        </div>
        <div class="col-sm-3">
            <label class="control-label"></label>
        </div>
        <div class="col-sm-3">
        </div>

    </div>

    <div class="row" style="padding-left:20px">
        <h5>Your Last few Transactions were</h5>
    </div>
    <div class="row">
        <asp:GridView ID="GridViewTransactions"  CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="GridViewTransactions_DataBound" OnRowDataBound="GridViewTransactions_RowDataBound" OnSelectedIndexChanged="GridViewTransactions_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>

