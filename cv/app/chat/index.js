const $ = (el) => {
  return document.getElementById(el);
};

function showchat() {
  $("chatbox").style = `
    width:300px;
    height:400px;
    opacity:1;
    overflow:visible;`;
}
function hiddenchat() {
  $("chatbox").style = `
    width:0px;
    height:0px;
    opacity:0;
    overflow:hidden;`;
}
function sendmsg() {
  let now = new Date();
  let me = `
    <p class="me">${$("msg").value}
        <br><br>
        <span>${now.getHours()}:${now.getMinutes()}</span>
    </p>`;
  $("main").insertAdjacentHTML("beforeend", me);
  $("msg").value = "";
  sendans();
  $('main').scrollTop=$('main').scrollHeight;
}
function sendans() {
  $("typing").style = `
    opacity: 1;
    width: 40px;
    overflow: visible;
    `;
  setTimeout(() => {
    let now = new Date();
    let ans = `
      <p class="you">Hello World!
          <br><br>
          <span>${now.getHours()}:${now.getMinutes()}</span>
      </p>`;
    $("main").insertAdjacentHTML("beforeend", ans);
    $("typing").style = `
    opacity: 0;
    width: 0;
    overflow: hidden;
    `;
    $('main').scrollTop=$('main').scrollHeight;
  }, 2000);
}
