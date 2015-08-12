<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Company_Stock _Information_Form.aspx.cs" Inherits="CSI_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Company Stock Information Entry</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Enter Company Stock Information</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnBack" CssClass="btn btn-block btn-danger" runat="server" CausesValidation="false" Text="Back" OnClick="btnBack_Click" />

        </div>
        <div class="col-sm-8"></div>
        <div class="col-sm-2">
            <asp:Button ID="btnView" CssClass="btn btn-primary btn-block" runat="server" CausesValidation="False" OnClick="btnView_Click" Text="View All Stocks" />
        </div>
    </div>
    <asp:Panel ID="pnlDataEntry" runat="server">

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Company Name:</label>

            </div>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddCompanyId" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_for_Comp_ID" DataTextField="Comp_Name" DataValueField="Comp_Id" OnDataBound="ddCompanyId_DataBound">
                </asp:DropDownList>

            </div>
            <div class="col-sm-3">
                <asp:SqlDataSource ID="SqlDataSource_for_Comp_ID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT DISTINCT [Comp_Id], [Comp_Name] FROM [tbl_Company_Information]"></asp:SqlDataSource>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label text-left">Stock Exchange Name</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtStockExName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStockExName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Scrip Code
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtScripCode" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Scrip Name
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtScripName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtScripName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Group Name
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtGroupName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Index Name</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtIndexName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>
       
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Earning Per Share
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtEPS" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Industry Type
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtInduType" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Total No. of Shares
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtTotal" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Listed Price of Share
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtListPrice" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtListPrice" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

        </div>
        <div class="form-group" >
            <div class="col-sm-3">

            </div>
            <div class=" col-sm-3" id="divBtnSubmit" runat="server">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-block" runat="server" Text="Submit" OnClick="Submit_Click" />
            </div>
            <div class="col-sm-3" id="divBtnDelete" runat="server">
                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block" runat="server" CausesValidation="False" OnClick="btnDelete_Click" Text="Delete" />
            </div>
        <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <asp:Label CssClass="bg-success center-block" ID="lblOutput" runat="server"></asp:Label>
            </div>
            <div class="col-sm-3"></div>
        </div>

    </asp:Panel>

    <asp:Panel ID="pnlDataView" runat="server">


        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Search By Company Name</label></div>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddCompanySearch" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_for_Comp_ID" DataTextField="Comp_Name" DataValueField="Comp_Id" OnDataBound="ddCompanySearch_DataBound">
                </asp:DropDownList>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asp:Button ID="btnSearch" CssClass="btn btn-block btn-primary" Text="Search" runat="server" OnClick="btnSearch_Click" />
            </div>
            <div class="col-sm-4"></div>
        </div>
         <%--<div class="form-control">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
            </div>
            <div class="col-sm-3"></div>
        </div>--%>

        <asp:GridView ID="GridViewStock" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
        <br />
    </asp:Panel>


</asp:Content>

