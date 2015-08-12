<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Information_Form.aspx.cs" Inherits="User_Information_Form" MasterPageFile="~/AfterLogin.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>User Information</title>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="PageTitle">
    <h2>User Information</h2>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="PageContents">
    <div class="form-group">
            <div class="col-sm-2">
                <asp:Button ID="btnBack" CssClass="btn btn-block btn-danger" runat="server" CausesValidation="false" Text="Back" OnClick="btnBack_Click" />
            </div>
            <div class="col-sm-8"></div>
            <div class="col-sm-2">
                <asp:Button ID="btnShowAll" CausesValidation="false" CssClass="btn btn-primary btn-block" runat="server" Text="Show All" OnClick="btnShowAll_Click" /></div>
        </div>

    <asp:Panel ID="pnlDataEntry" runat="server">

        <div class="form-group">
            <label class="control-label col-sm-3" for="ddUserType">User Rights</label>
            <div class="col-sm-3">
                <asp:CheckBox ID="cbManager" CssClass="checkbox-inline" runat="server" Text="Manager" />

            </div>
            <div class="col-sm-3">
                <asp:CheckBox ID="cbAccountant" CssClass="checkbox-inline" runat="server" Text="Accountant" />
            </div>
            <div class="col-sm-3">
                <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddUserType" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-3">


                <asp:CheckBox ID="cbAdmin" CssClass="checkbox-inline" runat="server" Text="Administrator" />
            </div>
            <div class="col-sm-3">
                <asp:CheckBox ID="cbClerk" CssClass="checkbox-inline" runat="server" Text="Clerk" />
            </div>
            <div class="col-sm-3"></div>

        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-3">
                <asp:CheckBox ID="cbDocGen" CssClass="checkbox-inline" runat="server" Text="Document Generation" />
            </div>
            <div class="col-sm-3">
                <asp:CheckBox ID="cbRepGen" CssClass="checkbox-inline" runat="server" Text="Report Generation" />
            </div>
            <div class="col-sm-3"></div>
        </div>


        <div class="form-group">

            <label class="control-label col-sm-3" for="txtEmail">Email ID</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="alert-warning" runat="server" ErrorMessage="Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="txtPassword">Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">

            <label for="txtPassword2" class="control-label col-sm-3">Re-Enter Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword2" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" CssClass="" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ErrorMessage="Password Mismatch"></asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtFullName" class="control-label col-sm-3">Full Name</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFullName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="rbGroup" class="control-label col-sm-3">Gender</label>
            <div class="col-sm-6">
                <div id="rbGroup">

                    <asp:RadioButton ID="rbMale" CssClass="radio-inline" runat="server" Text="Male" GroupName="grpGender" />
                    <asp:RadioButton ID="rbFemale" CssClass="radio-inline" runat="server" Text="Female" GroupName="grpGender" />

                </div>
            </div>

            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <label for="txtMobile" class="control-label col-sm-3">Mobile No.</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control "></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMobile" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">

            <label for="txtAddress" class="control-label col-sm-3">Address</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtCity" class="control-label col-sm-3">City</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control "></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCity" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtState" class="control-label col-sm-3">State</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtState" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtPincode" class="control-label col-sm-3">Pincode</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3"></div>

        </div>
         <div class="form-group">
            <label for="txtPincode" class="control-label col-sm-3">Pincode</label>
            <div class="col-sm-6">
                <asp:FileUpload ID="fuProfilePic" runat="server" />
            </div>
            <div class="col-sm-3"></div>

        </div>

        <div class="form-group">

            <div class="col-sm-3"></div>
            <div class="col-sm-3" id="divSubmit" runat="server">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-block" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-sm-3" id="divDelete" runat="server">
                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block" runat="server" CausesValidation="False" OnClick="btnDelete_Click" Text="Delete" Visible="False" /><br />
            </div>
            <div class="col-sm-3"></div>



        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <asp:Label ID="lblOutput" CssClass="bg-pr­imary" runat="server"></asp:Label>
            </div>
            <div class="col-sm-2"></div>

        </div>

    </asp:Panel>
    <asp:Panel ID="pnlDataView" Visible="false" runat="server">

        

               <%-- <div class="form-group">
            <label for="txtSearchUserType" class="control-label col-sm-2">Usertype:</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtSearchUsertype" CssClass="form-control" runat="server" MaxLength="20"></asp:TextBox>
            </div>
            <div class="col-sm-4"></div>
        </div>--%>



        <div class="form-group">

            <label for="txtSearchUserType" class="control-label col-sm-2">Search By Name:</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtSearchFullName" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-4"></div>
        </div>



        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-4 ">
                <asp:Button ID="btnSearch" CausesValidation="false" CssClass="btn btn-primary btn-block" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>

            <div class="col-sm-5"></div>
        </div>




        <br />
        <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
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

