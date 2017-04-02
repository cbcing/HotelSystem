<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>前台服务</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

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
  <!--  <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' /> -->

    <!--[if lt IE 9]>
  <!--    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>  -->
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
												<h4>菜单</h4>
										</div>
								</div>


								<div class="row-fluid">
										<table class="table table-hover" >
												<thead>
														<tr>
																<th class="span3">
																		菜名
																</th>
																<th class="span3">
																		<span class="line"></span>菜系
																</th>
																<th class="span3">
																		<span class="line"></span>助记码
																</th>
																<th class="span3">
																		<span class="line"></span>单位
																</th>
																<th class="span3">
																		<span class="line"></span>单价
																</th>
														</tr>
												</thead>
												<tbody id="unselected">
												<s:iterator value="#session.showCaipin" id="scp" status="st">
													<tr>
														<td><s:property value="#scp.name"></s:property></td>
														<td><s:property value="#scp.sort_id"></s:property></td>
														<td><s:property value="#scp.code"></s:property></td>
														<td><s:property value="#scp.unit"></s:property></td>
														<td><s:property value="#scp.unit_price"></s:property></td>
													</tr>
												</s:iterator>
												</tbody>
										</table>
								</div>
						</div>


						<div class="table-wrapper products-table section">
								<div class="row-fluid head">
										<div class="span12">
												<h4>已选</h4>
										</div>
								</div>


								<div class="row-fluid">
										<table class="table table-hover" >
												<thead>
														<tr>
																<th class="span3">
																		菜名
																</th>
																<th class="span3">
																		<span class="line"></span>菜系
																</th>
																<th class="span3">
																		<span class="line"></span>助记码
																</th>
																<th class="span3">
																		<span class="line"></span>单位
																</th>
																<th class="span3">
																		<span class="line"></span>单价
																</th>
															<th class="span3">
																<span class="line"></span>数量
															</th>

														</tr>
												</thead>
												<tbody id="selected">

												</tbody>
										</table>
								</div>
						</div>

					<div class="table-wrapper products-table section">
						<div class="row-fluid head">
							<div class="span12">
								<h4>账单</h4>
							</div>
						</div>


						<div class="row-fluid">
							<table class="table table-hover" >
								<thead>
								<tr>
									<th class="span3">
										用户
									</th>
									<th class="span3">
										<span class="line"></span>选择餐台
									</th>
									<th class="span3">
										<span class="line"></span>时间
									</th>
									<th class="span3">
										<span class="line"></span>金额
									</th>
									<th class="line">
										<span class="line"></span>操作
									</th>

								</tr>
								</thead>
								<tbody>
									<tr>
										<td>one</td>
										<td>
										</td>
										<td>
											<div id="time"></div>
										</td>
										<td>
											<label id="total"></label>
										</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<a class="btn-glow success">确认提交</a>


				</div>
		</div>
</div>


<!-- scripts -->
    <script src="js/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>

		<script type="text/javascript">
			window.onload = function(){
				bindUnselectedClick();
				getSystemTime();
			}
			var setAttr = [];
			function bindUnselectedClick(){
				//设置id
				setAttr = document.getElementById("unselected").getElementsByTagName("tr");
				for (var i = 0; i < setAttr.length; i++){
					setAttr[i].setAttribute("id", i+1);
				}

				var unselected = document.getElementById("unselected").getElementsByTagName("tr");
				for (var i = 0; i < unselected.length; i++) {
					bindItemsClick(unselected[i]);
				}
			}

			/*
			 <input class="min" name="" type="button" value="-" />
			 <input class="text_box" name="" type="text" value="1" />
			 <input class="add" name="" type="button" value="+" />
			 */

			function bindItemsClick(item){
				item.onclick = function(){
					var parent = item.parentNode;
					parent.removeChild(this);
					if(parent.id == "unselected"){
						document.getElementById("selected").appendChild(this);
						var newElement = document.createElement("td");
						var newInputOne = document.createElement("input");
						newInputOne.setAttribute("class", "min");
						//newInputOne.class = "min";
						newInputOne.setAttribute("name", "");
						//newInputOne.name = "";
						newInputOne.setAttribute("type", "button");
						//newInputOne.type = "button";
						newInputOne.setAttribute("value", "-");
						//newInputOne.value = "-";
						var newInputTwo = document.createElement("input");
						newInputTwo.setAttribute("class", "text_box");
						//newInputTwo.class = "text_box";
						newInputTwo.setAttribute("name", "");
						//newInputTwo.name = "";
						newInputTwo.setAttribute("type", "text");
						//newInputTwo.type = "text";
						newInputTwo.setAttribute("value", "1");
						//newInputTwo.value = "1";
						var newInputThree  = document.createElement("input");
						newInputThree.setAttribute("class", "add");
						//newInputThree.class = "add";
						newInputThree.setAttribute("name", "");
						//newInputThree.name = "";
						newInputThree.setAttribute("type", "button");
						//newInputThree.type = "button";
						newInputThree.setAttribute("value", "+");
						//newInputThree.value = "+";
						newElement.appendChild(newInputOne);
						newElement.appendChild(newInputTwo);
						newElement.appendChild(newInputThree);


						var tr = document.getElementById("selected").getElementsByTagName("tr");
						for(var i = 0 ; i < tr.length; i++){
							tr[i].appendChild(newElement);
						}

					} else {
						this.removeChild(this.lastChild);
						document.getElementById("unselected").appendChild(this);
					}
				}
			}
			
			function getSystemTime() {
				var dateTime = new Date();
				var years = dateTime.getFullYear();
				var months = dateTime.getMonth()+1;
				var day = dateTime.getDate();
				var hours = dateTime.getHours();
				var minutes = dateTime.getMinutes();
				hours = extra(hours);
				document.getElementById("time").innerHTML=years+"-"+months+"-"+day+" "+hours+":"+minutes;
				setTimeout("getSystemTime()", 1000);

			}

			function extra(x)
			{
				if(x < 10)
				{
					return "0" + x;
				}
				else
				{
					return x;
				}
			}
		</script>
		<script>
			$(function(){
				$(".add").css("z-index","999").click(function(){
					var t=$(this).parent().find('input[class*=text_box]');
					t.val(parseInt(t.val())+1)
					setTotal();
					alert("xxx");
					return false;
				})
				$(".min").click(function(){
					var t=$(this).parent().find('input[class*=text_box]');
					t.val(parseInt(t.val())-1)
					if(parseInt(t.val())<0){
						t.val(0);
					}
					setTotal();
					return false;
				})
				function setTotal(){
					var s=0;
					$("#tab td").each(function(){
						s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text());
					});
					$("#total").html(s.toFixed(2));
				}
				setTotal();
			})
		</script>
</body>
</html>
