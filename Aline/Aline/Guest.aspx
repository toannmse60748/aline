<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Guest.aspx.cs" Inherits="Aline.Guest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CULTURE FIT</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/prettify.css" rel="stylesheet" />
    <!-- -->
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="http://twitter.github.com/bootstrap/assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-57-precomposed.png">
    <!-- -->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-146052-10']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
    <!--------------------------------------------------------->
    <style type="text/css">
        .style6
        {
            width: 86px;
        }
        .style7
        {
            width: 153px;
        }
    </style>
</head>
<!-- Navbar
        ================================================== -->
<div class="navbar navbar-inverse" style="position: static;">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                    <div class="nav-collapse collapse navbar-inverse-collapse">
                        <ul class="nav">
                            <li><a href="./Guest.aspx">Home</a></li>
                            <!--    <%--phần cho management--%>-->
                            <li><a href="./Admin.aspx">Login</a></li>
                        </ul>
                        <!--phần đăng nhập-->
                    </div>
                    <!-- /.nav-collapse -->
        </div>
    </div>
    <!-- /navbar-inner -->
</div>
<!-- /navbar -->
<!-- Banner
    ================================================== -->
<header class="subhead" id="overview">
    <p><img width=2559 height=314 src="img/food-banner.JPG"/></p>
  </header>
<!-- Docs nav
  ================================================== -->
<body style="background-color: Maroon;">
    <div class="container-fluid">
        <div class="row-fluid">
            <!--<%-- KHUNG CHÍNH--%>-->
            <div class="span9">
                <form id="Form2" class="form-horizontal" runat="server">
                <div class="well" style="max-width: 900px; padding: 8px 0;">
                    <div class="page-header">
                        <h1>
                            <p style="margin-left: 7%; color: #8E859F;">
                                CULTURE FIT TESTING</p>
                        </h1>
                        <%--điền User Name--%>
                        <div class="control-group">
                            <label class="control-label">
                                Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <%--điền email--%>
                        <div class="control-group">
                            <label class="control-label">
                                Email</label>
                            <div class="controls">
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <p>
                            Candidate, please review the below and pick the 5 questions that best reflect your
                            ideal work life at your dream job and/or your ideal relationship with a job</p>
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            <div class="span10">
                <asp:DataList ID="dlView" runat="server">
                    <ItemTemplate>
                        <div class="hero-unit">
                            <div class="row">
                                <div class="span8">
                                    <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged"
                                        AutoPostBack="true" Text='<%#Eval("id") %>' />
                                    <p>
                                        <%#Eval("noidung") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            </form>
        </div>
        </div>
        <!-- KHUNG PHỤ-->
        <div class="span3">
            <img src="img/user-manage.jpg" class="img-rounded">
            <%--phần dành cho MODAL--%>
            <%--kết thúc phần MODAL--%>
        </div>
    </div>
    </div>
    <!-- Footer
        ================================================== -->
    <footer class="footer">
   <div class="alert alert-error">
      <p class="pull-right"><a href="#"><i class="icon-home"></i> START START PAGEp>
       
     <p>Copyright, ALINE, 2016     <p>Designed by: Minh Toan Nguyen</p>
     <p>Location: JAPAN, TOKYO</p>         
    </div>
  </footer>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
    <script src="js/bootstrap-modal.js" type="text/javascript"></script>
</body>
</html>
