<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'gateone.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script src="js/gateone.js">
</script>
	</head>

	<body>
		<form id="add_terminal">
			<input type="submit" value="START" class="btn btn-primary"
				id="connect_btn"></input>
		</form>
		<div id="gateone_container"
			style="position: relative; width: 60em; height: 30em;">
			<div id="gateone"></div>
		</div>
	</body>

	<script type="text/javascript">
var newTerminal =function() {
    GateOne.Base.superSandbox("NewExternalTerm", ["GateOne.Terminal", "GateOne.Terminal.Input"], function(window, undefined) {
        "use strict";
        var existingContainer = GateOne.Utils.getNode('#'+GateOne.prefs.prefix+'container');
    var container = GateOne.Utils.createElement('div', {
            'id': 'container', 'class': 'terminal', 'style': {'height': '100%', 'width': '100%'}
    });
    var gateone = GateOne.Utils.getNode('#gateone');
    // Don't actually submit the form
    if (!existingContainer) {
            gateone.appendChild(container);
    } else {
            container = existingContainer;
    }
    // Create the new terminal
    var termNum = GateOne.Terminal.newTerminal(null, null, container); 
    GateOne.Terminal.sendString('49.123.69.203\n',null)
    GateOne.Terminal.sendString('\n',null)
    });
};
	
window.onload = function() {
	GateOne.init( {
		url : 'http://49.123.69.203:8000',
		embedded : true,
		// Let's apply some custom styles while we're at it ...
		/*style : {
			'background-color' : 'black',
			'box-shadow' : '0 0 40px gray'
		}*/
	})
}
</script>
	<script>
document.querySelector('#add_terminal').onsubmit = function(e) {
	// Don't actually submit the form
	e.preventDefault();
	var existingContainer = GateOne.Utils
			.getNode('#' + GateOne.prefs.prefix + 'container');
	var container = GateOne.Utils.createElement('div', {
		'id' : 'container',
		'class' : 'terminal',
		'style' : {
			'height' : '100%',
			'width' : '100%'
		}
	});
	var gateone = GateOne.Utils.getNode('#gateone');
	if (!existingContainer) {
		gateone.appendChild(container);
	} else {
		container = existingContainer;
	}
	// Create the new terminal
	termNum = GateOne.Terminal.newTerminal(null, null, container);
}
</script>

</html>
