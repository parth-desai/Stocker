<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forget_Password.aspx.cs" Inherits="Forget_Password" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Forgot Password </title>
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
        <form id="Form2" class="form-vertical login-form"  method="post" runat="server">
            <h4 class="form-title">Enter your Email Address to get your Password</h4>
            <div class="control-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">Username</label>
                <div class="controls">
                    <div class="input-icon left">
                        <i class="icon-user"></i>
                        <input class="m-wrap placeholder-no-fix" type="text" autocomplete="off" placeholder="Email Address" name="txtemailid" id="txtemailid" />
                        <%--<asp:TextBox ID="txtUsername" CssClass="m-wrap placeholder-no-fix" runat="server"></asp:TextBox>--%>
                    </div>
                </div>
            </div>
          
            <div class="form-actions">
              
                <asp:Button ID="btngetpwd" CssClass="btn blue pull-right" runat="server" Text="Get Password" OnClick="btngetpwd_Click" />
                <br />
                <br />
                <div style="color:white">
                <asp:Label ID="lblforgetpwd"  Text="" runat="server"></asp:Label>
                    </div>
            </div>
          

        </form>
        
        <!-- END LOGIN FORM -->
        <!-- BEGIN COPYRIGHT -->
        <div class="copyright">
            2015 &copy; Stocker!!!
        </div>

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
