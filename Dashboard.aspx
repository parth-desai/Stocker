<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    <h2> Dashboard</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" Runat="Server">

    <div class="row" style="padding-left:20px;padding-right:20px;max-height:300px">
        
            <h3>
                Latest News  :</h3>
                
                    <ul  style="padding-left:30px; list-style:square" runat="server" id="ulNews">
                        
                    </ul>
                
            
        </div>
        
        <div class="row" style="padding-left:20px;padding-right:20px;">
            <h3>

                Company Stock Price
                <asp:Label ID="lblSPDate" runat="server"></asp:Label>
            </h3>
            <asp:GridView ID="GridViewStockPrice" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridViewStockPrice_RowDataBound" OnSelectedIndexChanged="GridViewStockPrice_SelectedIndexChanged" >
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
        <br />
    
            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
    
        </div>
    

</asp:Content>

