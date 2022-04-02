function right(r) {
    var l = r.previousElementSibling;
    var p = r.parentNode.parentNode;
    l.classList.add("d-sm-block");
    p.scrollLeft += 500;

    if ((p.offsetWidth + p.scrollLeft) + 10 > p.scrollWidth) {
      r.classList.remove("d-sm-block");
    }
  }
  function left(l) {
    var r = l.nextElementSibling;
    var p = l.parentNode.parentNode;

    p.scrollLeft -= 500;
    if (p.scrollLeft < 500 || p.scrollLeft == 500) {

      l.classList.add("d-none");
      r.classList.add("d-sm-block");
    }
    if (p.offsetWidth + p.scrollLeft < p.scrollWidth) {
      r.classList.add("d-sm-block");

    }
  }
  function scrolled(thise){
      
    var e=thise.lastElementChild;
    var left=e.children[0];
    var right=e.children[1];

    if (thise.scrollLeft !=0) {
        left.classList.add('d-sm-block');
    }else{
        left.classList.remove('d-sm-block');
    }
    if((thise.offsetWidth + thise.scrollLeft) + 10 >= thise.scrollWidth){
        right.classList.remove('d-sm-block');
    }else{
        if((thise.offsetWidth + thise.scrollLeft) + 10 < thise.scrollWidth){
            right.classList.add('d-sm-block');
        }
    }

  }