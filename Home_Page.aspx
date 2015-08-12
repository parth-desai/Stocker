<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home_Page.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Stocker!!!!!</title>


    <!--REQUIRED STYLE SHEETS-->

    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="Assets_Home_Page/css/bootstrap.css" rel="stylesheet" />

    <!-- FONTAWESOME STYLE CSS -->
    <link href="Assets_Home_Page/css/font-awesome.min.css" rel="stylesheet" />

    <!-- CUSTOM STYLE CSS -->
    <link href="Assets_Home_Page/css/style.css" rel="stylesheet" />

    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <form id="form1" runat="server">
        <header>
            <!--Header section  -->
            <div class="container" id="home">
                <div class="row text-center">
                    <div class="col-md-12">
                        <h1 class="head-main"><i class="fa fa-desktop fa-2x"></i>STOCKER!!!</h1>
                        <h2 class="head-sub-main">A INTELLIGENT STOCK/SHARE MANAGEMENT SYSTEM</h2>


                    </div>


                </div>
            </div>

        </header>
        <!--End Header section  -->

        <!-- Navigation -->
        <nav class="navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx">STOCKER!!! </a>
                </div>
                <!-- Collect the nav links for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="#home">HOME</a>
                        </li>
                        <li><a href="#about">ABOUT</a>
                        </li>
                        <li><a href="#contact-sec">CONTACT</a>
                        </li>
                        <li style="background-color:red;">
                            <a href="Login_Page.aspx">LOGIN</a>
                        </li>
                       
                    </ul>
                    
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <!--End Navigation -->

        <!--About Section-->
        <%--<section class="color-white " id="about">
            <div class="container">

                <div class="row text-center">
                    <div class="col-lg-8 col-lg-offset-2 ">
                        <h2 style="padding-top: 50px;">Company's Profile</h2>
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>

                </div>


            </div>
        </section>--%>

        <section class="color-light" id="about">
            <div class="container">


                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="text-center">About System</h2>
                       <p style="font-size: 20px;"> Stocker is a easy to use share management system for any-sized industry.It can be easily be adopted by employees of your company. </p>
                       <p style="font-size: 20px;"> Stocker makes you or your employees enabled to take powerful decisions for your company so that you can take your company to higher levels. </p>
                        
                            The following are the salient features of the system :
                              <ul style="font-size: 20px;">
                                  <li>Inteliigently designed to make data entries smoother </li>
                                  <li>Simple and easy to use design</li>
                                  <li>System is developed considering all the roles which can be played by employees in a enterprise like yours.</li>
                                  <li>Portfolio for shareholders </li>
                              </ul>
                        
                    </div>
                </div>
            </div>

        </section>
        <!--End About Section-->



        <!-- WORK Flow Section -->
        <%--<section class="color-white " id="work-sec">
            <div class="container">

                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h2>Work Flow</h2>
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>

                </div>

                <div class="row text-center g-pad-bottom">

                    <div class="col-md-4">

                        <div class="work-div">

                            <i class="fa fa-desktop fa-5x"></i>


                            <h3>Initial Step #1 </h3>


                        </div>

                    </div>

                    <div class="col-md-4 ">

                        <div class="work-div">

                            <i class="fa fa-share fa-5x"></i>



                        </div>

                    </div>
                    <div class="col-md-4 ">

                        <div class="work-div">

                            <i class="fa fa-flask fa-5x"></i>


                            <h3>Final Step #2</h3>


                        </div>

                    </div>



                </div>
            </div>
        </section>
        <!--End WORK Flow  Section -->--%>

        <!-- Contact Section -->
        <section class="color-light " id="contact-sec">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h2>Locate Us here</h2>
                        <h4>
                            <strong>Fill out the following form to reach to us or Hit us a Email at Following Email addresses.....
                            </strong>
                        </h4>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-5 contact-cls">
                        <h3>Email Address</h3>
                        <div>
                            <span><i class="fa fa-envelope"></i>parthdesai1894@gmail.com</span>
                            <br />
                            <span><i class="fa fa-envelope"></i>sid.kotecha10@gmail.com</span>


                        </div>


                    </div>
                    <div class="col-md-7">

                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" id="txtName" class="form-control" required="required" placeholder="Name" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" id="txtEmail" class="form-control" required="required" placeholder="Email address" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <textarea name="message" id="txtMessage" required="required" class="form-control" rows="3" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <%--<button type="submit" class="btn btn-default">Submit Request</button>--%>
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-default" Text="Submit Request" runat="server" OnClick="btnSubmit_Click"/>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div id="social-icon">
                            <a href="#"><i class="fa fa-facebook fa-2x"></i></a>
                            <a href="#"><i class="fa fa-twitter fa-2x"></i></a>
                            <a href="#"><i class="fa fa-linkedin fa-2x"></i></a>
                            <a href="#"><i class="fa fa-google-plus fa-2x"></i></a>
                            <a href="#"><i class="fa fa-pinterest fa-2x"></i></a>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!--End Contact Section -->

        <!--footer Section -->
        <div id="footer" style="background-color: #000; color: #fff; padding: 20px 50px 20px 50px; text-align: right;">
            2015 Stocker!!! | All Right Reserved
         
        </div>
        <!--End footer Section -->

        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->

        <!-- CORE JQUERY  -->
        <script src="Assets_Home_Page/plugins/jquery-1.10.2.js"></script>

        <!-- BOOTSTRAP CORE SCRIPT   -->
        <script src="Assets_Home_Page/plugins/bootstrap.js"></script>

        <!-- CUSTOM SCRIPTS -->
        <script src="Assets_Home_Page/js/custom.js"></script>

    </form>
</body>
</html>
