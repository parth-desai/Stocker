<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dividend_Entry.aspx.cs" Inherits="Dividend_Entry" MasterPageFile="~/AfterLogin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dividend Entry</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Enter Dividend Details</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    
    
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnBack" CssClass="btn btn-adnger btn-block" Text="Back" runat="server" OnClick="btnBack_Click" />
        </div>
        <div class="col-sm-7">
        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnView" CssClass="btn btn-primary btn-block" Text="Show All Dividend" runat="server" OnClick="btnView_Click" />
        </div>
    </div>
    <asp:Panel ID="pnlDataEntry" runat="server">
    <div class="form-group">
        <div class="col-sm-3">
            <label for="" class="control-label">Company Name:</label>
        </div>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddCompany" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_for_Company_List" DataTextField="Comp_Name" DataValueField="Comp_Id" AutoPostBack="True" OnSelectedIndexChanged="ddCompany_SelectedIndexChanged" OnDataBound="ddCompany_DataBound">
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource_for_Company_List" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT DISTINCT [Comp_Id], [Comp_Name] FROM [Complist]"></asp:SqlDataSource>
        </div>
        <div class="col-sm-3">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label for="" class="control-label">Present Face Value</label>
        </div>
        <div class="col-sm-6">
            <asp:TextBox ID="txtFaceValue" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="col-sm-3">
        </div>


    </div>
    <div class="form-group">

        <div class="col-sm-3">
            <label for="" class="control-label">Dividend Date:</label>
        </div>
        <div class="col-sm-6">
            <asp:TextBox ID="txtDividendDate" CssClass="form-control" runat="server"></asp:TextBox>
             <script type="text/javascript">
                $(document).ready(function () {
                    $('#<%=txtDividendDate.ClientID%>').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: 'dd-MM-yy'
                    });
                });
            </script>
        </div>
      
        <div class="col-sm-3">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label for="" class="control-label">Dividend Percentage</label>

        </div>
        <div class="col-sm-6">
            <asp:TextBox ID="txtDividendPercent" CssClass="form-control" runat="server" OnTextChanged="txtDividendPercent_TextChanged1" AutoPostBack="True"></asp:TextBox>
        </div>
        <div class="col-sm-3">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label for="" class="control-label">Dividend Amount</label>

        </div>
        <div class="col-sm-6">
            <asp:TextBox ID="txtAmount" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="col-sm-3">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">
            <asp:Button CssClass="btn btn-primary btn-block" ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click"/>
        </div>
        
        <div class="col-sm-3">
        </div>

    </div>
    <div class="form-group">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">
            <asp:Label CssClass="bg-primary" ID="lblOutput" runat="server"></asp:Label>
        </div>
        <div class="col-sm-3">
        </div>

    </div>
         </asp:Panel>
    <asp:Panel ID="pnlDataView" runat="server">
        
        
        <div class="form-group">
            <div class="col-sm-3"><label class="control-label">Search By Comapany Name:</label></div>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddCompanySearch" runat="server" DataSourceID="SqlDataSource_for_Company_List" DataTextField="Comp_Name" DataValueField="Comp_Id"></asp:DropDownList>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asp:Button runat="server" ID="btnSearchCompany" CssClass="btn btn-primary btn-block" Text="Search" OnClick="btnSearchCompany_Click" />
            </div>
            <div class="col-sm-4"></div>
        </div>

        
        <br />
        <asp:GridView ID="GridViewDividend" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewDividend_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" />
        <%--    <Columns>
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

        <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <asp:Label ID="lblErrorDividend" runat="server" CssClass="bg-danger center-block" Visible="false"></asp:Label>
            </div>
            <div class="col-sm-3"></div>
        </div>

    
    </asp:Panel>


</asp:Content>
