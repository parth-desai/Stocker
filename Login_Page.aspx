﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Page.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login Form</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="Assets_Login_Page/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets_Login_Page/plugins/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="Assets_Login_Page/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Assets_Login_Page/css/style-metro.css" rel="stylesheet" />
    <link href="Assets_Login_Page/css/style.css" rel="stylesheet" />
    <link href="Assets_Login_Page/css/style-responsive.css" rel="stylesheet" />
    <link href="Assets_Login_Page/css/themes/default.css" rel="stylesheet" />
    <link href="Assets_Login_Page/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="Assets_Login_Page/plugins/select2/select2_metro.css" />


    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="Assets_Login_Page/css/pages/login-soft.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="login">
    <!-- BEGIN LOGO -->
    <div class="logo" style="color: white; font-size: 40px">
        <!-- PUT YOUR LOGO HERE -->
        STOCKER!!!
    </div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
    <!-- END LOGO -->
    <!-- BEGIN LOGIN -->
    <div class="content">
        <!-- BEGIN LOGIN FORM -->
        <form class="form-vertical login-form"  method="post" runat="server">
            <h3 class="form-title">Login to your account</h3>
            <div class="alert alert-error hide">
                <button class="close" data-dismiss="alert"></button>
                <span>Enter any username and password.</span>
            </div>
            <div class="control-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">Username</label>
                <div class="controls" style="color:white">
                    <div class="input-icon left" >
                        <i class="icon-user"></i>
                        <input class="m-wrap placeholder-no-fix" type="email"  runat="server"  autocomplete="off" placeholder="Username" name="username" id="txtUsername" required/>
                        <%--<asp:TextBox ID="txtUsername" CssClass="m-wrap placeholder-no-fix" runat="server"></asp:TextBox>--%>
                    </div>
                </div>
            </div>
            
            <div class="control-group">
                <label class="control-label visible-ie8 visible-ie9">Password</label>
                <div class="controls">
                    <div class="input-icon left">
                        <i class="icon-lock"></i>
                        <input class="m-wrap placeholder-no-fix" runat="server" type="password" placeholder="Password" name="password" id="txtPassword" value="" required/>
                        <%-- <asp:TextBox ID="txtPassword"  CssClass="m-wrap placeholder-no-fix" runat="server" TextMode="Password"></asp:TextBox>--%>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">User Type</label>
                <div class="controls">
                    
                    <asp:DropDownList ID="ddUserType" CssClass="m-wrap placeholder-no-fix" runat="server" Width="373px" >
                        <asp:ListItem Value="0">Select a User Type</asp:ListItem>
                        <asp:ListItem Value="1">Employee</asp:ListItem>
                        <asp:ListItem Value="2">Shareholder</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                
            </div>
            <div class="form-actions">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
				<label class="checkbox">
                    <%--<input type="checkbox" name="remember" value="1" />--%>
                    <asp:CheckBox ID="cbRemember" Text="Remember Me" runat="server" />
                  
                </label>
               
                <asp:Button CssClass="btn blue pull-right" runat="server" Text="Submit" OnClick="Unnamed1_Click" />
            <%--    </div>
            <div>--%>
                <div style="color:white">
                <asp:Label ID="lblError" style="color:yellow;" Text="" runat="server"></asp:Label>
                    </div>
            </div>
            <div class="forget-password">
                <h4>Forgot your password ?</h4>
                <p>
                    No worries, Click <a style="color: yellow" href="Forget_Password.aspx" id="forget-password">HERE</a>
                    to Reset your Password.
                </p>

            </div>
            <div class="copyright">
            2015 &copy; Stocker!!!
        </div>
        </form>
        
        <!-- END LOGIN FORM -->
        <!-- BEGIN COPYRIGHT -->
        <br />
        <br />
        

    </div>
        <!-- END COPYRIGHT -->
        <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

        <!-- BEGIN CORE PLUGINS -->
        <script src="Assets_Login_Page/plugins/jquery-1.10.1.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

        <!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
        <script src="Assets_Login_Page/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <!--[if lt IE 9]>
	<script src="assets/plugins/excanvas.min.js"></script>
	<script src="assets/plugins/respond.min.js"></script>  
	<![endif]-->
        <script src="Assets_Login_Page/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/jquery.cookie.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="Assets_Login_Page/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <script type="text-login/javascript" src="Assets_Login_Page/plugins/select2/select2.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="Assets_Login_Page/scripts/app.js" type="text/javascript"></script>
        <script src="Assets_Login_Page/scripts/login-soft.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                App.init();
                Login.init();
            });
        </script>
        <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
