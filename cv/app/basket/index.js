const basket = document.getElementById("basket");

function add(el, id) {
  var img = el.children[0].children[0].src;
  var txt = el.children[1].innerText;
  var slct = document.getElementsByClassName("slct")[id];
  slct.style.display = "block";
  slct.style.cursor = "default";
  el.removeAttribute("onclick");
  var product = `<div class="product">
    <div><img src="${img}"></div>
    <div>${txt}</div>
    <i onclick="rm(this,${id})" class="fas fa-times"></i>
</div>`;
  basket.insertAdjacentHTML("beforeend", product);
}
function rm(el, id) {
  el.parentElement.remove();
  var slct = document.getElementsByClassName("slct")[id];
  slct.style.display = "none";  
  slct.style.cursor = "pointer";
  slct.parentElement.setAttribute("onclick", `add(this,${id})`);
}
