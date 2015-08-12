<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Company_Information_Form.aspx.cs" Inherits="Company_Information_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Company Information Form</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Enter Company Details</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnBack" CssClass="btn btn-block btn-danger" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="Back" />
        </div>
        <div class="col-sm-7">

        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnView" runat="server" CssClass="btn btn-block btn-primary" CausesValidation="False" OnClick="btnView_Click" Text="View All Companies" />
        </div>
    </div>

    <asp:Panel ID="pnlDataEntry" runat="server">
                   
            
            
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Name</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Company Start Date</label></div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtStartDate" CssClass="form-control" runat="server"></asp:TextBox></div>
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

            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStartDate" ErrorMessage="*"></asp:RequiredFieldValidator></div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Contact Person</label></div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtContact" CssClass="form-control" runat="server"></asp:TextBox></div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContact" ErrorMessage="*"></asp:RequiredFieldValidator></div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Address</label></div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox></div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="*"></asp:RequiredFieldValidator></div>

        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">City</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtCity"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>


        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">State</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtState" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Pincode</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>


        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Phone No.</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>


        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Fax No.</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtFax" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>


        </div>
         <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Face Value</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtFaceValue" CssClass="form-control" Text="10" Enabled="false" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
         </div>

        <div class="form-group">
            <div class="col-sm-3"></div>
            <div id="divSubmit" runat="server" class="col-sm-3">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-block" runat="server" Text="Submit" OnClick="Submit_Click" />
            </div>
            <div id="divDelete" runat="server" class="col-sm-3">
                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block" runat="server" CausesValidation="False" OnClick="btnDelete_Click" Text="Delete" />
            </div>
            <div class="col-sm-3"></div>

        </div>
        <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <asp:Label ID="lblOutput" CssClass="bg-primary center-block text-center"  runat="server"></asp:Label>
            </div>
            <div class="col-sm-3"></div>



        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDataView" runat="server">
        
        
        <div class="form-group">
            <div class="col-sm-3"><label class="control-label">Search By Comapany Name:</label></div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtSearchCompName" runat="server" CssClass="form-control" ></asp:TextBox>
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

        
        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>

        
        <br />
        <asp:GridView ID="GridViewCompany" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridViewCompany_RowDataBound">
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
    </asp:Panel>

</asp:Content>

