const txt=document.getElementById('txt');
const divs=document.getElementsByTagName('div');
let statekeys=true;

function num(N){
    txt.value+=N; 
}
function showkeys(){
    if(statekeys){
        for(let div of divs){
            div.style.padding="5px";
            div.style.margin="15px";
            div.style.height="17.5px";
        }
        statekeys=false;
        txt.style.boxShadow="inset -1.5px 1.5px 4px #15171a, inset 1.5px -1.5px 4px #535d66";
    }else{
        for(let div of divs){
            div.style.padding="0";
            div.style.margin="0";
            div.style.height="0";
        }
        statekeys=true;
        txt.style.boxShadow="-1.5px 1.5px 4px #15171a,1.5px -1.5px 4px #535d66"
    }
}
function check(){
    statekeys=false;
    showkeys();
}
function times(){
    check();
    txt.value="";
}