<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Shareholder_Information_Form.aspx.cs" Inherits="Shareholder_Information_Form" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Shareholder Information Form</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Shareholder Details </h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnBack" CssClass="btn btn-block btn-danger" runat="server" CausesValidation="false" Text="Back" OnClick="btnBack_Click" />
        </div>
        <div class="col-sm-7"></div>
        <div class="col-sm-3">
            <asp:Button ID="btnView" CssClass="btn btn-primary btn-block" runat="server" Text="View All Shareholders" CausesValidation="False" OnClick="btnView_Click1" />
        </div>
    </div>
    <asp:Panel ID="pnlDataEntry" runat="server">
        <div class="form-group">
            <div class="col-sm-3">
                <label for="" class="control-label">Shareholder Type</label>
            </div>
            <div class="col-sm-3">
                 <asp:DropDownList ID="ddlShTypeMain" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Main_Category" DataValueField="Main_Category" OnSelectedIndexChanged="ddlShTypeMain_SelectedIndexChanged" OnDataBound="ddlShTypeMain_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT DISTINCT [Main_Category] FROM [tbl_Shareholder_Type]"></asp:SqlDataSource>
            </div>
            <div class="col-sm-3">
                <asp:DropDownList ID="ddlShTypeSub" CssClass="form-control" runat="server" OnDataBound="ddlShTypeSub_DataBound" >
                </asp:DropDownList>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label for="control-label">Email ID</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtEmailId" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtEmailId" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailId" ErrorMessage="Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Password</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Re-Enter Password</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtRepwd" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtRepwd"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd" ControlToValidate="txtRepwd" ErrorMessage="Password Mismatch"></asp:CompareValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Mobile No</label>

            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtMobileNo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtMobileNo"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Full Name</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
            </div>
        </div>

        

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Address
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                   City
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    State
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtState"></asp:RequiredFieldValidator>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Pincode
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox CssClass="form-control" ID="txtPinCode" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Date Of Birth/Incorporation
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server"></asp:TextBox>
                 <script type="text/javascript">
                     $(document).ready(function () {
                         $('#<%=txtDOB.ClientID%>').datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'dd-MM-yy',
                             yearRange: '1900:c'
                        });
                    });
                </script>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    PAN No.
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPan" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtPan"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Profession
                </label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtProfession" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>
        </div>
          <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">
                    Profile Picture
                </label>
            </div>
            <div class="col-sm-6">
                <asp:FileUpload id="fuProfilePic" runat="server"></asp:FileUpload>
            </div>
            <div class="col-sm-3"></div>
        </div>




        <div class="form-group">
            <div class="col-sm-3">

            </div>
            <div class="col-sm-3" id="divSubmit" runat="server">
                <asp:Button ID="btnSubmit" CssClass="btn btn-block btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
            </div>
            <div class="col-sm-3" id="divDelete" runat="server">
                <asp:Button ID="btnDelete" CssClass="btn btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click1" />
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-6">
                <asp:Label ID="lblOutput" runat="server"></asp:Label>
            </div>
            <div class="col-sm-3">
            </div>


        </div>


    </asp:Panel>

    <asp:Panel ID="pnlDataView" runat="server">
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Search By Name</label>
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtShareholderSearch" CssClass="form-control" runat="server" Text=""></asp:TextBox>
               <%-- <script type="text/javascript">

                    $(document).ready (function () {
                        $(function () 
                        {
                            $('#<%=txtShareholderSearch.ClientID%>').keypress(function (event) 
                            {
                                if (event.keyCode == 13) 
                                {
                                    $('#<%=txtShareholderSearch.ClientID%>').click();
                                }
                            })
                            
                        })})
                </script>--%>
            </div>
            <div class="col-sm-3"></div>

        </div>

        <div class="form-group">
            <div class="col-sm-3">
                
            </div>
            <div class="col-sm-6">
                <asp:Button ID="btnShareholderSearch" CssClass="btn btn-primary btn-block" Text="Search" runat="server" OnClick="btnShareholderSearch_Click"></asp:Button>
            </div>
            <div class="col-sm-3"></div>

        </div>
        
        <asp:GridView ID="GridView1" class="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </asp:Panel>
</asp:Content>

