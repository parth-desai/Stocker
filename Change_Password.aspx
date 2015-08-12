<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Change Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Change your Password</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
       
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">Email ID:</label></div>
                <div class="col-sm-5">
                    <asp:TextBox ID="txt_Email" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">Old Password:</label></div>
                <div class="col-sm-5">
                    <asp:TextBox ID="txt_oldp" CssClass="form-control" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    
                </div>
                 <div class="col-sm-4">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Field cannot be left blank" ControlToValidate="txt_oldp"></asp:RequiredFieldValidator>
                 </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">New Password:</label></div>
                <div class="col-sm-5">
                    <asp:TextBox ID="txt_newp" CssClass="form-control" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    
                </div>
                 <div class="col-sm-4">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Filed cannot be left blank" ControlToValidate="txt_newp"></asp:RequiredFieldValidator>
                 </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">Confirm New Password :</label></div>
                <div class="col-sm-5">
                    <asp:TextBox ID="txt_connp" CssClass="form-control" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    
                </div>
                 <div class="col-sm-4">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Field cannot be left blank" ControlToValidate="txt_connp"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both the fields should be same" ControlToCompare="txt_newp" ControlToValidate="txt_connp"></asp:CompareValidator>
                 </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-3"></div>
                <div class="col-sm-5">
                    <asp:Button ID="btn_changepass" runat="server"  CssClass="btn btn-primary btn-block" Text="Change Password" OnClick="btn_changepass_Click" />
                    
                </div>
                 <div class="col-sm-4"></div>
            </div>
            <div class="form-group">
                <div class="col-sm-3"></div>
                <div class="col-sm-5">
                    <asp:Label ID="lbl_Output" CssClass="bg-primary" runat="server" Text=""></asp:Label>
                </div>
                 <div class="col-sm-4"></div>
            </div>
       
    
        

</asp:Content>

