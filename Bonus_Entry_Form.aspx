<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Bonus_Entry_Form.aspx.cs" Inherits="Bonus_Entry_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bonus Entry</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Enter Bonus Details</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnBack" CssClass="btn btn-block btn-danger" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="Back" />
        </div>
        <div class="col-sm-7">
        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnView" runat="server" CssClass="btn btn-block btn-primary" CausesValidation="False" OnClick="btnView_Click" Text="View Bonus History" />
        </div>
    </div>

    <asp:Panel ID="pnlDataEntry" runat="server">

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label" for="ddCompanyName">Company Name:</label>
            </div>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddCompanyName" CssClass="form-control" runat="server" OnDataBound="ddCompanyName_DataBound" DataSourceID="SqlDataSource_For_Company_List" DataTextField="Comp_Name" DataValueField="Comp_Id" OnSelectedIndexChanged="ddCompanyName_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSource_For_Company_List" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT DISTINCT [Comp_Id], [Comp_Name] FROM [Complist]"></asp:SqlDataSource>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label" for="txtBonusDate">Bonus Date</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtBonusDate" CssClass="form-control" runat="server"></asp:TextBox>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#<%=txtBonusDate.ClientID%>').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: 'dd-MM-yy'
                    });
                });
                </script>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtBonusDate" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label " for="">Bonus Ratio</label>
            </div>
            <div class="col-sm-2">
                <asp:TextBox ID="txtRatio1" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-2 text-center center-block"><b>for</b></div>
            <div class="col-sm-2">
                <asp:TextBox ID="txtRatio2" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <asp:Button ID="Submit" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="Submit_Click" />
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <asp:Label ID="lblOutput" CssClass="bg-success center-block" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDataView" runat="server">


        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Search By Company Name:</label></div>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddCompanySearch" CssClass="form-control" runat="server" OnDataBound="ddCompanySearch_DataBound" DataSourceID="SqlDataSource_For_Company_List" DataTextField="Comp_Name" DataValueField="Comp_Id" ></asp:DropDownList>
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
        <asp:GridView ID="GridViewBonus" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
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
                <asp:Label CssClass="bg-danger center-block" ID="lblErrorBonus" runat="server" Visible="false"></asp:Label>
            </div>
            <div class="col-sm-3"></div>
        </div>
        
    </asp:Panel>
    

</asp:Content>

