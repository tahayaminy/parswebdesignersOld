const $=el=>{return document.getElementById(el);}
const answers = { a0: 0, a1: 1, a2: 2 };
var quiz = [];
function exam() {
    $('article').style=`
    pointer-events: all;
    opacity: 1;
    `;
  for (var i = 0; i < 3; i++) {
    for(let radio of document.getElementsByName(`r${i}`)) {
        if(radio.checked){
            quiz.push(eval(radio.value));
        }
    }
  }
  var index=0;
  var truen=0;
  var falsen=0;
  var ansarray=Object.values(answers);
  for(let answer of ansarray){
    if(answer==quiz[index]){truen++;}else{falsen++;}
    index++;
  }
  $('green').innerText=truen;
  $('red').innerText=falsen;
  $('all').innerText=ansarray.length;
  quiz=[];
}
function cls(){
    $('article').style=`
    pointer-events: none;
    opacity: 0;
    `;
}
