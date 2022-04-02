const far=document.getElementsByClassName("far");
const fas=document.getElementsByClassName("fas");
const span=document.getElementsByTagName("span");
var state=true;
var num=document.getElementById("num");

function hover(el){
    if(state){
        for(let i=0;i<=el;i++){
            span[i].children[0].style.opacity="0";
            num.innerText=i+1;
        }
        
    }
}
function out(el){
    if(state){
        for(let i=0;i<=el;i++){
            span[i].children[0].style.opacity="1";
            num.innerText="";
        }
        
    }
}
function score(el){
    if(state){
        for(let i=0;i<=el;i++){
            span[i].children[0].style.opacity="0";
            num.innerText=i+1;
        }
        state=false;
        for(let i=0;i<span.length;i++){
            span[i].style.cursor="default";
        }
    }
    
}