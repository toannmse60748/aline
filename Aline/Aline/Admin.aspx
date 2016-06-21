<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Aline.Admin" %>

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
                <div class="well" style="max-width: 900px; padding: 8px 0;">
                    <div class="page-header">
                        <h1>
                            <p style="margin-left: 7%; color: #8E859F;">
                                User List</p>
                        </h1>
                    </div>
                    <asp:DataList ID="dlAccount" runat="server" Width="755px">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="style1" style="width: 100px">
                                            User Name
                                        </th>
                                        <th class="style7" style="width: 100px">
                                            Mail
                                        </th>
                                        <th class="style7" style="width: 100px">
                                            Result
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" class="table" border="0">
                                <tbody>
                                    <tr class="success">
                                        <td class="style5" style="width: 100px">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        </td>
                                        <td class="style5" style="width: 100px">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                        </td>
                                        <td class="style5" style="width: 05px">
                                            <asp:Label ID="Label4" runat="server" Text="job: "></asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("result") %>'></asp:Label>
                                            <asp:Label ID="Label5" runat="server" Text="calling: "></asp:Label>
                                            <asp:Label ID="Label6" runat="server" Text="carrer: "></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
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
      <p class="pull-right"><a href="#"><i class="icon-home"></i> START PAGE</a></p>
     <p>Copyright, ALINE, 2016</p>
     <p>Designed by: Minh Toan Nguyen</p>
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
