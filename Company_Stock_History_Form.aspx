<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Company_Stock_History_Form.aspx.cs" Inherits="Company_Stock_History_Form" MasterPageFile="~/AfterLogin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Company Stock History </title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    <h2> Company Stock History</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" Runat="Server">

    <div class="form-group">
        <div class="col-sm-3">
            </div>
        <div class="col-sm-6">
            <asp:DropDownList CssClass="form-control" ID="ddlCompanyName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_forcompanyname" DataTextField="Comp_Name" DataValueField="Comp_Id" OnSelectedIndexChanged="ddlCompanyName_SelectedIndexChanged" OnDataBound="ddlCompanyName_DataBound" >
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_forcompanyname" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT DISTINCT [Comp_Id], [Comp_Name] FROM [Complist]"></asp:SqlDataSource>
        
        </div>
        <div class="col-sm-3"></div>
    </div>
      <div class="form-group">
        <div class="col-sm-3">
            </div>
        <div class="col-sm-6">
            <asp:Label ID="lblOutput" CssClass="center-block" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-sm-3"></div>
    </div>

<asp:GridView ID="gridviewStockHistory" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
           <%-- <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>--%>
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


</asp:Content>

