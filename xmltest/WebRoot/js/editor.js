//初始化编辑器
function initEditor(editor){
	//设置风格主题
    theme = "monokai"
	editor.setTheme("ace/theme/" + theme);
	//设置编辑语言
    language = "c_cpp"
    editor.session.setMode("ace/mode/" + language);
    //字体大小
    editor.setFontSize(14);
    //设置只读（true时只读，用于展示代码；false用于编辑）
    editor.setReadOnly(false); 
    //自动换行,设置为off关闭
    editor.setOption("wrap", "free");
	//启用自动补全提示
    ace.require("ace/ext/language_tools");
    editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
    });
	bindFullScreen(editor);
	bindHelp(editor);
	bindSave(editor);
}
//绑定全屏
function bindFullScreen(editor){
	//绑定窗口
	var $ = document.getElementById.bind(document);
	//加载dom对象
	var dom = ace.require("ace/lib/dom");
	//添加全屏指令，绑定F11功能键
	ace.require("ace/commands/default_commands").commands.push({
		name: "Toggle Fullscreen",
		bindKey: "F11",
		//执行指令
		exec: function(editor) {
			var fullScreen = dom.toggleCssClass(document.body, "fullScreen");
			dom.setCssClass(editor.container, "fullScreen", fullScreen);
			editor.setAutoScrollEditorIntoView(!fullScreen);
			editor.resize();
		}
	});
}
//添加显示快捷键列表功能
function bindHelp(editor){
	editor.commands.addCommand({
		name: "showKeyboardShortcuts",
		bindKey: {win: "Ctrl-Alt-h", mac: "Command-Alt-h"},
		exec: function(editor) {
			ace.config.loadModule("ace/ext/keybinding_menu", function(module) {
			module.init(editor);
			editor.showKeyboardShortcuts();
			});
		}
	});
}
//保存功能函数
function save(editor){
	localStorage.savedValue = editor.getValue(); 
}
//绑定保存按钮
function bindSave(editor){
	editor.commands.addCommand({
		name: "save",
		exec: save,
		bindKey: { win: "ctrl-alt-s", mac: "cmd-s" }
	});
	editor.session.setValue(localStorage.savedValue || "欢迎使用!");
}
//删除保存内容
function delSave(){
	localStorage.savedValue="欢迎使用!";
}
//光标处插入
function insertAtCursor() {
	if($("#code").hasClass("hidden")){
		alert("请先完成当前插入操作");
	}else{
		editor.selection.selectFileStart();
		editor1.setValue(editor.session.getTextRange(editor.getSelectionRange()));
		editor.selection.selectFileEnd();
		editor3.setValue(editor.session.getTextRange(editor.getSelectionRange()));
		editor2.setTheme("ace/theme/clouds");
		editor2.setValue("");
		$("#code").addClass("hidden");
		$("#code1").removeClass("hidden");
		$("#code2-home").removeClass("hidden");
		$("#code2").removeClass("hidden");
		$("#code3").removeClass("hidden");
	}
}
//插入结束
function insertComplete(){
	editor.setValue(editor1.getValue()+"\r"+editor2.getValue()+"\r"+editor3.getValue());
	editor1.destroy();
	$("#code").removeClass("hidden");
	$("#code1").addClass("hidden");
	$("#code2").addClass("hidden");
	$("#code2-home").addClass("hidden");
	$("#code3").addClass("hidden");
}

