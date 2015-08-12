<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Share_Transaction_Entry.aspx.cs" Inherits="Share_Transaction_Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Share Transaction Entry</title>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Share Transaction Details</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnBack" CssClass="btn btn-block btn-danger" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="Back" />
        </div>
        <div class="col-sm-7">
        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnView" runat="server" CssClass="btn btn-block btn-primary" CausesValidation="False" OnClick="btnView_Click" Text="View Transactions" />
        </div>
    </div>

    <asp:Panel runat="server" ID="pnlDataEntry">
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Transaction Type:</label>
        </div>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddTransType" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddTransType_SelectedIndexChanged">
                <asp:ListItem Value="0" >Select a Transaction Type</asp:ListItem>
                <asp:ListItem Value="1">Allotment</asp:ListItem>
                <asp:ListItem Value="2">Transfer</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-sm-4">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Transaction Date:</label>
        </div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtTransDate" CssClass="form-control" runat="server"></asp:TextBox>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#<%=txtTransDate.ClientID%>').datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'dd-MM-yy',
                            yearRange: '1900:c'
                        });
                    });
            </script>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTransDate" ErrorMessage="*"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Exchange Name:</label>
        </div>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddExchangeName" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_for_Exchange_Name" DataTextField="Stock_Exchange_Name" DataValueField="Stock_Exchange_Name" OnSelectedIndexChanged="ddlExName_SelectedIndexChanged" OnDataBound="ddExchangeName_DataBound" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_for_Exchange_Name" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT DISTINCT [Stock_Exchange_Name] FROM [tbl_Company_Stock_Information]"></asp:SqlDataSource>
        </div>
        <div class="col-sm-4">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Company:</label>
        </div>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddCompanyName"  CssClass="form-control" runat="server" DataTextField="Comp_Name" DataValueField="Comp_Id" OnDataBound="ddCompanyName_DataBound" OnSelectedIndexChanged="ddCompanyName_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-sm-4">
        </div>

    </div>

    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Buyer:</label>
        </div>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddBuyerName" runat="server" CssClass="form-control" DataSourceID="SqlDataSource_For_Buyer" DataTextField="SH_Full_Name" DataValueField="SH_Id" OnSelectedIndexChanged="ddlBuyer_SelectedIndexChanged" OnDataBound="ddBuyerName_DataBound" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_For_Buyer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [SH_Id], [SH_Full_Name] FROM [tbl_Shareholder_Information]"></asp:SqlDataSource>
        </div>
        <div class="col-sm-4">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Seller:</label>
        </div>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddSellerName" runat="server" CssClass="form-control" DataTextField="SH_Full_Name" DataValueField="SH_Id" OnDataBound="ddSellerName_DataBound">
            </asp:DropDownList>
        </div>
        <div class="col-sm-4">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Quantity:</label>
        </div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtQty" runat="server" AutoPostBack="True" CssClass="form-control" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQty" ErrorMessage="*"></asp:RequiredFieldValidator>
        </div>

    </div>

    <div class="form-group">
        <div class="col-sm-3">
            <label class="control-label">Rate:</label>
        </div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtRate" runat="server" AutoPostBack="True" CssClass="form-control" OnTextChanged="txtRate_TextChanged"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRate" ErrorMessage="*"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">

        <div class="col-sm-3">
            <label class="control-label">Amount:</label>
        </div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAmount" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="col-sm-4"></div>
    </div>

    <div class="form-group">

        <div class="col-sm-offset-3 col-sm-5">
            <asp:Button ID="btnTransfer" CssClass="btn btn-primary btn-block" runat="server" Text="Transfer" OnClick="btnTransfer_Click" />
        </div>
        <div class="col-sm-4"></div>
    </div>
    <div class="form-group">

        <div class="col-sm-offset-3 col-sm-5">
            <asp:Label ID="lblOutput" CssClass="bg-primary" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-sm-4"></div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnlDataView" runat="server">


        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Search By Company Name:</label></div>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlCompany" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceCompany" DataTextField="Comp_Name" DataValueField="Comp_Id" OnDataBound="ddlCompany_DataBound"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceCompany" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT DISTINCT [Comp_Name], [Comp_Id] FROM [Complist]"></asp:SqlDataSource>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Start Date:</label></div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtStartDate" CssClass="form-control" runat="server"></asp:TextBox>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#<%=txtStartDate.ClientID%>').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: 'dd-MM-yy',
                        yearRange: '1900:c'
                    });
                });
            </script>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">End Date:</label></div>
            
            <div class="col-sm-6">
                <asp:TextBox ID="txtEndDate" CssClass="form-control" runat="server"></asp:TextBox>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#<%=txtEndDate.ClientID%>').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: 'dd-MM-yy',
                        yearRange: '1900:c'
                    });
                });
            </script>
                </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asp:Button runat="server" ID="btnSearchTransaction" CssClass="btn btn-primary btn-block" Text="Search" OnClick="btnSearchTransaction_Click"  />

            </div>
            <div class="col-sm-4"></div>
        </div>


        <br />
        <asp:GridView ID="GridViewTransaction" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridViewTransaction_RowDataBound" >
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
         <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <asp:Label CssClass="bg-danger center-block" ID="lblError" runat="server" Visible="false"></asp:Label>
            </div>
            <div class="col-sm-3"></div>
        </div>
        
    </asp:Panel>
</asp:Content>

