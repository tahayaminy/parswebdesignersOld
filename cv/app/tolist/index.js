const $ = (el) => {
  return document.getElementById(el);
};

function add() {
  if ($("work").value.length >= 3) {
    let p = document.createElement("p");
    let work = document.createTextNode($("work").value);
    let check=`<i class="fas fa-check-circle" onclick="end(this)"></i>`;
    let clear=`<i class="clear"></i>`;

    p.appendChild(work);
    p.insertAdjacentHTML("beforeend",check);
    p.insertAdjacentHTML("beforeend",clear);
    $("lists").insertAdjacentElement("beforeend", p); 
    $("work").value="";   
  }
}
function end(work){
    work.parentElement.remove();
}
