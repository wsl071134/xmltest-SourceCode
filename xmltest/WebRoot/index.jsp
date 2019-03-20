<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<title>并行编程助手</title>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<!-- 移动设备优先 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- 引入 Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
		<script src="js/ace/ace.js" type="text/javascript" charset="utf-8">
</script>
		<script src="js/ace/ext-language_tools.js" type="text/javascript"
			charset="utf-8">
</script>
		<script src="js/index.js" type="text/javascript" charset="utf-8">
</script>
		<script src="js/editor.js" type="text/javascript" charset="utf-8">
</script>
		<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
		<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
		<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
		<script src="js/jquery.js">
</script>
		<!-- 包括所有已编译的插件 -->
		<script src="js/bootstrap.min.js">
</script>
		<script src="js/gateone.js">
</script>
	</head>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default navbar-inverse navbar-static-top"
						role="navigation">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">导航</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li>
								<a href="#">语法检查</a>
							</li>
							<li>
								<a href="#">在线编译</a>
							</li>
							<li>
								<a href="#">联系我们</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">帮助<strong
									class="caret"></strong> </a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">MPI教程</a>
									</li>
									<li class="divider">
									</li>
									<li>
										<a href="#">OpenMP教程</a>
									</li>
									<li class="divider">
									</li>
									<li>
										<a href="#">使用指南</a>
									</li>
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group">
								<input type="text" class="form-control" />
							</div>
							<button type="submit" class="btn btn-default">
								搜索
							</button>
						</form>
					</div>
					</nav>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-3 column">
					<!-- 第一层折叠菜单 -->
					<div class="panel-group" id="panel-first">
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title collapsed" data-toggle="collapse"
									data-parent="#panel-first" href="#panel-element-1">MPI例程</a>
							</div>
							<div id="panel-element-1" class="panel-collapse collapse">
								<div class="panel-body">
									<!-- 第二层折叠菜单 -->
									<div class="panel-group" id="panel-second">
										<div class="panel panel-default">
											<!-- 菜单头 -->
											<div class="panel-heading">
												<a class="panel-title collapsed" data-toggle="collapse"
													data-parent="#panel-second" href="#panel-element-11">初等例程</a>
											</div>
											<!-- 菜单内容 -->
											<div id="panel-element-11" class="panel-collapse collapse">
												<a class="list-group-item" href="#" title=".."> 111 <span
													class="glyphicon glyphicon-info-sign pull-right"
													style="font-size: 16px;"></span> <span
													class="glyphicon glyphicon-plus-sign pull-right"
													style="font-size: 16px; margin-right: 10px;"
													onclick='insertAtCursor();'></span> </a>
											</div>
										</div>


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 column">
					<form id="form" onsubmit="return false" action="##" method="get">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">
									在线编辑
								</h3>
							</div>
							<div type="text" id="code-box" class="ace_editor"
								style="min-height: 400px"></div>
						</div>
						<input id="checkerr" type="button" value="编译" />
						<input id="close" type="button" value="关闭终端" />
						<input id="add_terminal" type="button" value="START"
							class="btn btn-primary"></input>
						<input type="hidden" name="code" id="hidden" />
					</form>
					<div id="gateone_container"
						style="position: relative; width: 60em; height: 15em;">
						<div id="gateone"></div>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
				</div>
			</div>
		</div>
	</body>
</html>