function $(el) {
    return document.getElementById(el);
}
var width;
var left;
var statemenu = false;

function closemenu() {
    $("top").style.transform = "rotate(50deg)";
    $("bottom").style.transform = "rotate(-50deg)";
    statemenu = false;
    $("menu").style.width = (innerWidth>=931)? "30%":"0px";
    $("menuicon").style.left = "0";
}

function menuicon() {
    if (innerWidth >= 768 && innerWidth <= 931) {
        width = 40 + '%';
        left = 39.5 + '%';
    } else if (innerWidth >= 425 && innerWidth <= 768) {
        width = 50 + '%';
        left = 49.5 + '%';
    } else if (innerWidth >= 375 && innerWidth <= 425) {
        width = 300 + 'px';
        left = 290 + 'px';
    } else if (innerWidth >= 0 && innerWidth <= 375) {
        width = 250 + 'px';
        left = 240 + 'px';
    } else {
        $("menu").style.width = "30%";
    }
    if (!statemenu) {
        $("top").style.transform = "rotate(-50deg)";
        $("bottom").style.transform = "rotate(50deg)";
        statemenu = true;
        $("menu").style.width = width;
        $("menuicon").style.left = left;
    } else {
        closemenu();
    }

}