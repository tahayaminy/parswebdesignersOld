const hour = document.getElementById("hour");
const min = document.getElementById("min");
const sec = document.getElementById("sec");
const body = document.getElementById("body");
const clock = document.getElementById("clock");

function clockSet(){
  var now = new Date();
  var secT = (now.getSeconds() * 360) / 60;
  var minT = (now.getMinutes() * 360) / 60;
  var hourT = (now.getHours() * 360) / 12;
  hour.style.transform = `rotate(${hourT + 90}deg)`;
  min.style.transform = `rotate(${minT + 90}deg)`;
  sec.style.transform = `rotate(${secT + 90}deg)`;
  if (now.getHours() <= 17 && now.getHours() >= 6) {
    body.style.backgroundColor = "#a2d2ff";
    clock.style.border = "5px solid #a2d2ff";
    clock.style.boxShadow = `5px 5px 10px #7193b3,
    -5px -5px 10px #d3ffff,inset 5px 5px 10px #7193b3,
    inset -5px -5px 10px #d3ffff`;
  } else {
    body.style.backgroundColor = "#2e4c6d";
    clock.style.border = "5px solid #2e4c6d";
    clock.style.boxShadow = `5px 5px 10px #20354c, -5px -5px 10px #3c638e,
    inset 5px 5px 10px #20354c, inset -5px -5px 10px #3c638e`;
  }
}
clockSet();


setInterval(clockSet, 1000);
setTimeout(()=>{
  body.style.transition='60s';
clock.style.transition='60s';
},10000);