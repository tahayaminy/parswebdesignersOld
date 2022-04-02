function $(el) {
    return document.getElementById(el);
}

var editor = ClassicEditor
    .create($('editor'), {
        ckfinder: {
            uploadUrl: 'http://parswebdesigners.ir/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
        },
        toolbar: {
            items: [
                'heading',
                '|',
                'bold',
                'italic',
                'underline',
                'strikethrough',
                'superscript',
                'subscript',
                'highlight',
                'link',
                '|',
                'bulletedList',
                'numberedList',
                'todoList',
                '|',
                'alignment',
                'outdent',
                'indent',
                '|',
                'redo',
                'undo',
                '-',
                'imageUpload',
                'blockQuote',
                'insertTable',
                'mediaEmbed',
                'imageInsert',
                '|',
                'code',
                'codeBlock',
                'sourceEditing',
                'htmlEmbed',
                '|',
                'specialCharacters',
                'removeFormat',
                'pageBreak',
                '-',
                'fontBackgroundColor',
                'fontColor',
                'fontFamily',
                'fontSize',
                'horizontalLine'
            ],
            shouldNotGroupWhenFull: true
        },
        language: 'fa',
        image: {
            toolbar: [
                'imageTextAlternative',
                'imageStyle:inline',
                'imageStyle:block',
                'imageStyle:side',
                'linkImage'
            ]
        },
        table: {
            contentToolbar: [
                'tableColumn',
                'tableRow',
                'mergeTableCells',
                'tableCellProperties',
                'tableProperties'
            ]
        },
        licenseKey: '',

    })
    .then(editor => {
        window.editor = editor;


    })
    .catch(error => {
        console.error('Oops, something went wrong!');
        console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
        console.warn('Build id: 8gs8hguu85f8-kdln8ig0tx7');
        console.error(error);
    });
// add code value
var count = 0;
var slctmodes=document.getElementById('selectmodes');

function addcodevalue() {
    count++;
    var codevalues = $('codevalues');
    var codevaluehtml = `<div class="codevalue">
    <b>جعبه کد ` + count + `</b>
    `+ slctmodes.outerHTML +`
    <textarea class="code" style="width: 80%;" rows="5"></textarea>
</div>
<br>`;
    codevalues.insertAdjacentHTML('beforeend', codevaluehtml);
}

var len=0;
var InsertUpdate=true;
function autosave(S) {
    var Data = editor.getData();
    if (len == 75 || S>=0) {
        var courseId = $('courseId');
        var seasonId = $('seasonId');
        var mode = document.getElementsByClassName('mode');
        var code = document.getElementsByClassName('code');
        var keyword=$('keyword').value;
        var description=$('description').value;
        var CodeData = {};
        for (let i = 0; i < count; i++) {
            var CDcode = code[i].value;
            var CDmode = mode[i].value;
            CodeData[i] = {code: CDcode, mode: CDmode};
        }
        CodeData=JSON.stringify(CodeData);
        var formdata = new FormData();
        formdata.append('courseId', courseId.value);
        formdata.append('seasonId', seasonId.value);
        formdata.append('Data', Data);
        formdata.append('CodeData', CodeData);
        formdata.append('InsertUpdate', InsertUpdate);
        formdata.append('keyword',keyword);
        formdata.append('description',description);
        if(S==1){
            formdata.append('status',1);
        }else if(S==0){
            formdata.append('status',0);
        }
        var ajax = new XMLHttpRequest();
        ajax.open('POST', 'senddata.php');
        ajax.send(formdata);
        len=0;
        InsertUpdate=false;
        if(S>=0){window.location.replace("./index.php");}
    }else{
        len++;
    }
}