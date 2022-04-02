var state = false;
var previous;
var dir;
var size;

function accordion(thisis, past) {
    if (!state) {
        showaccordion(thisis, past);
        state = true;
    } else if (past == previous) {
        closeaccordion(thisis);
        state = false;
    } else {
        closeaccordion(dir);
        showaccordion(thisis, past);
        state = true;
    }
}
function showaccordion(thisis, past) {
    thisis.nextElementSibling.style.height = "auto";
    thisis.children[0].style.display = "block";
    thisis.children[1].style.display = "none";
    thisis.style.background = "none";
    thisis.style.boxShadow = "none";
    previous = past;
    dir = thisis;
}
function closeaccordion(thisis) {
    thisis.nextElementSibling.style.height = "0";
    thisis.children[0].style.display = "none";
    thisis.children[1].style.display = "block";
    thisis.style.background = "linear-gradient(145deg, #eff1ef, #c9cbc9)";
    thisis.style.boxShadow = "5px 5px 8px #bbbdbb, -5px -5px 8px #ffffff";
}