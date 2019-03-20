window.onload = function() {
	var editor = ace.edit("code-box");
	initEditor(editor);
	document.getElementById("checkerr").onclick = function() {
		document.getElementById("hidden").value = editor.getValue();
		submit(editor);
	}
	document.getElementById("close").onclick = function() {
		for ( var term in GateOne.Terminal.terminals) {
			// Only want terminals which are integers; not the 'count()' function
			if (term % 1 === 0) {
				// The "true, '', false" below tells closeTerminal() to leave the localStorage alone, don't display a close message, and don't tell the server to kill it.
				GateOne.Terminal.closeTerminal(term, true, "", true);
			}
		}
	}

	//绑定点击添加新终端事件
	document.getElementById("add_terminal").onclick = function() {
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
		for ( var term in GateOne.Terminal.terminals) {
			// Only want terminals which are integers; not the 'count()' function
			if (term % 1 === 0) {
				// The "true, '', false" below tells closeTerminal() to leave the localStorage alone, don't display a close message, and don't tell the server to kill it.
				GateOne.Terminal.closeTerminal(term, true, "", true);
			}
		}
		termNum = GateOne.Terminal.newTerminal(null, null, container);
	}
	//GateOne初始化
GateOne.init({
		url : 'http://49.123.69.203:8000',
		embedded : true,
		// Let's apply some custom styles while we're at it ...
		/*style : {
			'background-color' : 'black',
			'box-shadow' : '0 0 40px gray'
		}*/
	});
	
	
	
	
}


function submit(editor) {
	$.ajax( {
		type : "GET",
		async : false,
		dataType : "text",
		url : "test",
		data : $('form').serialize(),
		success : function(data) {
			alert(data);
			if (data != null)
				editor.setValue(data);
		},
		error : function() {
			alert(222);
		}
	});
}
