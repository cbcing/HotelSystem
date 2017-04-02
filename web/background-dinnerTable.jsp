<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>餐台管理</title>

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
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/tables.css" type="text/css" media="screen" />

    <!-- open sans font -->
   <!-- <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' /> -->

    <!--[if lt IE 9]>
   <!-- <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>  -->
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
<div class="navbar navbar-inverse">
    <div class="navbar-inner">
        <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="brand" href="index.jsp"><img src="img/logo.png" /></a>
    </div>
</div>

<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li class="active">
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
            <a href="hotel.jsp">
                <i class="icon-home"></i>
                <span>主页</span>
            </a>
        </li>
        <li>
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
            <a href="frontServerOrder.action">
                <i class="icon-home"></i>
                <span>前台服务</span>
            </a>

        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-glass"></i>
                <span>后台管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="DeskManager.action">维护台号</a></li>
                <li><a href="SortManager.action">维护菜系</a></li>
                <li><a href="MenuManager.action">维护菜品</a></li>
            </ul>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-signal"></i>
                <span>结账报表</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="#">日结账报表</a></li>
                <li><a href="#">月结账报表</a></li>
                <li><a href="#">年结账报表</a></li>
            </ul>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-key"></i>
                <span>系统安全</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="#">用户管理</a></li>
                <li><a href="#">修改密码</a></li>
            </ul>
        </li>
        <li>
            <a href="index.jsp">
                <i class="icon-warning-sign"></i>
                <span>退出系统</span>
            </a>
        </li>
    </ul>
</div>

<div class="content">
    <div class="container-fluid">
        <div id="pad-wrapper">
            <div class="table-wrapper products-table section">
                <div class="row-fluid head">
                    <div class="span12">
                        <h4>餐台管理</h4>
                    </div>
                </div>

                <div class="row-fluid">
                    <table class="table table-hover" >
                        <thead>
                        <tr>
                            <th class="span3">
                                <span class="line"></span>餐台ID
                            </th>
                            <th class="span3">
                                <span class="line"></span>餐台号
                            </th>
                            <th class="span3 align-right">
                                <span class="line"></span>操作
                            </th>

                        </tr>
                        </thead>
                        <tbody id="unselected">
                        <!--
                        <tr>
                            <td>1</td>
                            <td>8001</td>
                            <td>
                                <ul class="actions">
                                    <li><a href="#">编辑</a></li>
                                    <li><a href="#">删除</a></li>
                                </ul>
                            </td>

                        </tr>
                        -->
                            <s:iterator value="#session.tb_desk" id="tb_desk" status="st">
                                <tr>
                                    <td><s:property value="#tb_desk.num"></s:property></td>
                                    <td><s:property value="#tb_desk.seating"></s:property></td>
                                    <td>
                                        <ul class="actions">
                                            <li><a href="editDinnerTable.action?id=<s:property value="#tb_desk.num"/>&seating=<s:property value="#tb_desk.seating"/>">编辑</a></li>
                                            <li><a href="delDinnerTable.action?id=<s:property value="#tb_desk.num"></s:property>">删除</a></li>
                                        </ul>
                                    </td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                </div>
                <p>添加餐台</p>
                <form action="addDinnerTable.action" method="post">
                    id:<input type="text" name="id" />
                    餐台号:<input type="text" name="seating"/>
                    <input type="submit" value="添加"/>
                </form>
                <p>修改餐台</p>
                <form action="chageDinnerTable.action" method="post">
                    餐台号:<input type="text" name="seating"  value="<s:property value="#session.dinner.seating"/>"/>
                    <input type="submit" value="修改"/>
                </form>
            </div>

        </div>
    </div>
</div>




<!-- scripts -->
<script src="js/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>



</body>
</html>
