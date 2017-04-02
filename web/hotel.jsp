<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>酒店管理系统</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- libraries -->
    <link href="css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/index.css" type="text/css" media="screen" />

    <!-- open sans font -->
  <!--  <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' /> -->

    <!-- lato font -->
  <!--  <link href='http://fonts.useso.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />  -->

    <!--[if lt IE 9]>
   <!-- <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
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
            <a class="brand" href="hotel.jsp"><img src="img/logo.png" /></a>
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

  <!-- scripts -->
  <script src="js/jquery-latest.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
  <!-- knob -->
  <script src="js/jquery.knob.js"></script>
  <!-- flot charts -->
  <script src="js/jquery.flot.js"></script>
  <script src="js/jquery.flot.stack.js"></script>
  <script src="js/jquery.flot.resize.js"></script>
  <script src="js/theme.js"></script>

  <script type="text/javascript">
      $(function () {

          // jQuery Knobs
          $(".knob").knob();



          // jQuery UI Sliders
          $(".slider-sample1").slider({
              value: 100,
              min: 1,
              max: 500
          });
          $(".slider-sample2").slider({
              range: "min",
              value: 130,
              min: 1,
              max: 500
          });
          $(".slider-sample3").slider({
              range: true,
              min: 0,
              max: 500,
              values: [ 40, 170 ],
          });



          // jQuery Flot Chart
          var visits = [[1, 50], [2, 40], [3, 45], [4, 23],[5, 55],[6, 65],[7, 61],[8, 70],[9, 65],[10, 75],[11, 57],[12, 59]];
          var visitors = [[1, 25], [2, 50], [3, 23], [4, 48],[5, 38],[6, 40],[7, 47],[8, 55],[9, 43],[10,50],[11,47],[12, 39]];

          var plot = $.plot($("#statsChart"),
                  [ { data: visits, label: "Signups"},
                      { data: visitors, label: "Visits" }], {
                      series: {
                          lines: { show: true,
                              lineWidth: 1,
                              fill: true,
                              fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }
                          },
                          points: { show: true,
                              lineWidth: 2,
                              radius: 3
                          },
                          shadowSize: 0,
                          stack: true
                      },
                      grid: { hoverable: true,
                          clickable: true,
                          tickColor: "#f9f9f9",
                          borderWidth: 0
                      },
                      legend: {
                          // show: false
                          labelBoxBorderColor: "#fff"
                      },
                      colors: ["#a7b5c5", "#30a0eb"],
                      xaxis: {
                          ticks: [[1, "JAN"], [2, "FEB"], [3, "MAR"], [4,"APR"], [5,"MAY"], [6,"JUN"],
                              [7,"JUL"], [8,"AUG"], [9,"SEP"], [10,"OCT"], [11,"NOV"], [12,"DEC"]],
                          font: {
                              size: 12,
                              family: "Open Sans, Arial",
                              variant: "small-caps",
                              color: "#697695"
                          }
                      },
                      yaxis: {
                          ticks:3,
                          tickDecimals: 0,
                          font: {size:12, color: "#9da3a9"}
                      }
                  });

          function showTooltip(x, y, contents) {
              $('<div id="tooltip">' + contents + '</div>').css( {
                  position: 'absolute',
                  display: 'none',
                  top: y - 30,
                  left: x - 50,
                  color: "#fff",
                  padding: '2px 5px',
                  'border-radius': '6px',
                  'background-color': '#000',
                  opacity: 0.80
              }).appendTo("body").fadeIn(200);
          }

          var previousPoint = null;
          $("#statsChart").bind("plothover", function (event, pos, item) {
              if (item) {
                  if (previousPoint != item.dataIndex) {
                      previousPoint = item.dataIndex;

                      $("#tooltip").remove();
                      var x = item.datapoint[0].toFixed(0),
                              y = item.datapoint[1].toFixed(0);

                      var month = item.series.xaxis.ticks[item.dataIndex].label;

                      showTooltip(item.pageX, item.pageY,
                              item.series.label + " of " + month + ": " + y);
                  }
              }
              else {
                  $("#tooltip").remove();
                  previousPoint = null;
              }
          });
      });
  </script>

</body>
</html>