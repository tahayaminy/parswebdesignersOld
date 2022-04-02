const $=el=>{return document.getElementById(el);}
function imageZoom(){
    var img=$('img');
    var result=$('result');

    var lenz=document.createElement("div");
    lenz.setAttribute("id","lenz");

    img.parentElement.insertBefore(lenz,img);

    var cx=result.offsetWidth/lenz.offsetWidth;
    var cy=result.offsetHeight/lenz.offsetHeight;
    console.log(result.offsetHeight);
    console.log(lenz.offsetHeight);
    console.log(cx+" "+cy);

    result.style.backgroundImage=`url('${img.src}')`;
    result.style.backgroundSize=`${img.width*cx}px ${img.height*cy}px`;

    lenz.addEventListener("mousemove",moveLenz);
    img.addEventListener("mousemove",moveLenz);
    lenz.addEventListener("touchmove", moveLenz);
    img.addEventListener("touchmove", moveLenz);

    function moveLenz(event){
        event.preventDefault();
        var pos=cursorPos(event);
        result.style.opacity=1;
        result.style.top=(event.clientY+40) +'px';
        result.style.left=(event.clientX-80)  +'px';
        var x=pos.x - (lenz.offsetWidth/2);
        var y=pos.y - (lenz.offsetHeight/2);

        if (x > img.width - lenz.offsetWidth) {x = img.width - lenz.offsetWidth;result.style.opacity=0;}
        if (x < 0) {x = 0;result.style.opacity=0;}
        if (y > img.height - lenz.offsetHeight) {y = img.height - lenz.offsetHeight;result.style.opacity=0;}
        if (y < 0) {y = 0;result.style.opacity=0;}
        lenz.style.left = x + "px";
        lenz.style.top = y + "px";
        result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
    }

    function cursorPos(e){
        e= e || window.event;
        var a=img.getBoundingClientRect();
        
        var x=(e.pageX-a.left) - window.pageXOffset;
        var y=(e.pageY-a.top) - window.pageYOffset;
        return {x:x,y:y};
    }
}
imageZoom();