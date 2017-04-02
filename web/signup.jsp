<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
	<title>酒店管理系统 - 注册账户</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signup.css" type="text/css" media="screen" />

    <!-- open sans font -->
   <!-- <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' /> -->

    <!--[if lt IE 9]>
    <!--  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
    <div class="header">
        <a href="hotel.jsp">
            <img src="img/logo.png" class="logo" />
        </a>
    </div>
    <div class="row-fluid login-wrapper">
        <div class="box">
            <div class="content-wrap">
                <h6>注册</h6>
                <input class="span12" type="text" placeholder="账户" />
                <input class="span12" type="password" placeholder="密码" />
                <input class="span12" type="password" placeholder="确认密码" />
                <div class="action">
                    <a class="btn-glow primary signup" href="index.jsp">注册</a>
                </div>
            </div>
        </div>

        <div class="span4 already">
            <p>已经注册账户了吗？</p>
            <a href="index.jsp">登陆系统</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="js/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>

</body>
</html>
