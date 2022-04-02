function $(el) {
    return document.getElementById(el);
}
var theme = "ayu-mirage";
var editor = CodeMirror(document.getElementById('codeeditor'), {
    mode: "htmlmixed",
    lineNumbers: true,
    autoCloseTags: true,
    autoCloseBrackets: true,
    matchBrackets: true,
    matchTags: { bothTags: true },
    styleActiveLine: true,
    extraKeys: { "Ctrl-Q": function (cm) { cm.foldCode(cm.getCursor()); } },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"],
    tabSize: 4,
    indentUnit: 4,
    indentWithTabs: true,
    scrollbarStyle: "simple"
});
editor.setOption("theme", theme);
var valuemobile="<!DOCTYPE html>\n<html>\n<head>\n<style></style>\n</head>\n<body>\n\n</body>\n<script><\/script>\n</html>";
var valuecomputer="<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<style></style>\n\t</head>\n\t<body>\n\t\t\n\t</body>\n\t<script><\/script>\n</html>";
function selecttheme(thisis) {
    theme = thisis.value;
    editor.setOption("theme", theme);
}

editor.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});

function makeMarker() {
    var marker = document.createElement("div");
    marker.style.color = "#67513e";
    marker.innerHTML = "●";
    return marker;
}

var height;var width;
if(window.innerWidth > 768){
    if(window.innerHeight >= window.innerWidth){
    width=window.innerWidth - 25;
    height=window.innerWidth - 25;
    }else{
        width=window.innerHeight- 25;
        height=window.innerHeight- 25;
    }
    editor.setOption("value", valuecomputer);
}else{
    height=window.innerHeight- 50;
    width=window.innerWidth - 25;
    editor.setOption("value", valuemobile);
}

function sesize() {
    if(window.innerWidth >=768){
        if(window.innerHeight >= window.innerWidth){
        width=window.innerWidth - 50;
        height=window.innerWidth - 50;
        }else{
            width=window.innerHeight- 50;
            height=window.innerHeight- 50;
        }
    }else{
        height=window.innerHeight- 50;
        width=window.innerWidth - 25;
    }
    editor.setSize(width, height);
    if(fs){
        editor.setSize(screen.width, screen.height);
    }
}
editor.setSize(width, height);

var state = true;
var fs;
function editorkey(key) {
    if (state) {
        key.innerHTML = "Edit!";
        var codes = editor.getValue();
        $("codeeditor").style.display = "none";
        $("browser").style.display = "block";
        if (fs) {
            $("browser").style.width = screen.width + "px";
            $("browser").style.height = screen.height + "px";
        } else {
            $("browser").style.width = width + "px";
            $("browser").style.height = height + "px";
        }

        var iframe = $('browser');
        iframe = (iframe.contentWindow) ? iframe.contentWindow : (iframe.contentDocument.document) ? iframe.contentDocument.document : iframe.contentDocument;
        iframe.document.open();
        iframe.document.write(codes);
        iframe.document.close();
        state = false;
    } else {
        key.innerHTML = "Run!";
        var codes = editor.getValue();
        $("codeeditor").style.display = "block";
        $("browser").style.display = "none";
        state = true;
    }

}
var statemenu = false;
function menuicon() {
    if (!statemenu) {
        $("top").style.transform = "rotate(50deg)";
        $("bottom").style.transform = "rotate(-50deg)";
        statemenu = true;
        $("menu").style.width = ((innerWidth >= 1440) ? 500 : 200) + "px";
        $("menuicon").style.right = ((innerWidth >= 1440) ? 490 : 190) + "px";
    } else {
        $("top").style.transform = "rotate(-50deg)";
        $("bottom").style.transform = "rotate(50deg)";
        statemenu = false;
        $("menu").style.width = "0px";
        $("menuicon").style.right = "0";
    }

}
var elem = document.body;

function openFullscreen(thisis) {
    fs = true;
    if (elem.requestFullscreen) {
        elem.requestFullscreen();
    } else if (elem.webkitRequestFullscreen) { /* Safari */
        elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) { /* IE11 */
        elem.msRequestFullscreen();
    }
    editor.setSize(screen.width, screen.height);
    $("article").style.margin = "0";
    document.getElementsByClassName("CodeMirror")[0].style.fontSize = "20px";
    document.getElementsByClassName("CodeMirror")[0].style.lineHeight = "30px";
    $("browser").style.width = screen.width + "px";
    $("browser").style.height = screen.height + "px";
    document.querySelector("#menu p:first-child").style.display = "block";
    thisis.style.display = "none";
}
function reset() {
    setsize1();
    document.getElementsByClassName("CodeMirror")[0].style.fontSize = "14px";
    document.getElementsByClassName("CodeMirror")[0].style.lineHeight = "20px";
    $("browser").style.width = width + "px";
    $("browser").style.height = height + "px";
    $("article").style.margin = "1% 0";
    $("aspect").style.display = "none";
    $("full").style.display = "block";
}
function closeFullscreen(thisis) {
    fs = false;
    if (document.exitFullscreen) {
        document.exitFullscreen();
    } else if (document.webkitExitFullscreen) { /* Safari */
        document.webkitExitFullscreen();
    } else if (document.msExitFullscreen) { /* IE11 */
        document.msExitFullscreen();
    }
    thisis.style.display = "none";
    document.querySelector("#menu p:nth-child(2)").style.display = "block";
    reset();
}

document.onfullscreenchange = function (event) {
    if ((document.fullscreenElement) == null) {
        fs = false;
        reset();
    }
};
function setsize1() {
    if (!fs) {
        sesize();
    }
}

/**/

var embed;
var src;
var name;
var obj = {};
var nobj; var vobj;

function check() {
    nobj = document.getElementById('name');
    vobj = document.getElementById('file');

    if (nobj.value != '' && vobj.value != '') {
        $('second').style.display = "flex";
        $('first').style.display = "none";
    } else if (nobj.value != '' || vobj.value != '') {
        $('first').style.display = "block";
        $('second').style.display = "none";
    } else {
        $('first').style.display = "none";
        $('second').style.display = "none";
    }
}

function embeded(thisis) {
    src = window.URL.createObjectURL(vobj.files[0]);

    obj[nobj.value] = src;


    var cont = '<div style="width:200px;display:flex;align-items:center;"><span style="width:100px;">' + nobj.value + '</span><span style="width:50px;"><input type="text" value="' + src + '" style="display:none;"><svg class="pointer" onclick="copi(this)" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-clipboard-plus" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/><path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/><path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/></svg></span><span style="width:50px;"><svg class="pointer" onclick="del(\'' + nobj.value + '\',this)" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></span></div>';
    $('show').insertAdjacentHTML('beforeend', cont);

    nobj.value = null;
    vobj.value = null;
    src = null;
    $('first').style.display = "none";
    $('second').style.display = "none";
}
function del(x, thisis) {
    delete obj[x];
    var element = thisis.parentElement.parentElement.remove();
}
function run() {
    var codes = $('place').value;
    var iframe = $('browser');
    iframe = (iframe.contentWindow) ? iframe.contentWindow : (iframe.contentDocument.document) ? iframe.contentDocument.document : iframe.contentDocument;
    iframe.document.open();
    iframe.document.write(codes);
    iframe.document.close();
}
function copi(thisis) {
    /* Get the text field */
    var copyText = thisis.previousElementSibling;

    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /* For mobile devices */

    /* Copy the text inside the text field */
    navigator.clipboard.writeText(copyText.value);
}