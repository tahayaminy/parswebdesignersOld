var bgSrc = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];
    var change;
    var stage = document.getElementById("stage");
    var btns = document.getElementsByName('radio');
    var i = 1;

    function show(prm, el) {
      var tst = document.getElementsByClassName("contimg");
      var next;
      var prev;
      if (prm == 0) {
        prev=((i-2)<0)? 5+(i-2) :i-2;
        next=i;
        i=((i-1)<0)? 5+(i-1) :i-1;
        stage.style.backgroundImage = "url(" + bgSrc[i] + ")";
        btns[i].checked=true;
        
        stage.previousElementSibling.style.backgroundImage =
          "url(" + bgSrc[prev] + ")";
        stage.nextElementSibling.style.backgroundImage =
          "url(" + bgSrc[next] + ")";
          

      } else if (prm == 1) {
        prev=i;
        next=((i+2)>=5)? Math.abs(5-(i+2)) :i+2;
        i=((i+1)==5)? 0 :i+1;
        stage.style.backgroundImage = "url(" + bgSrc[i] + ")";
        btns[i].checked=true;
        stage.previousElementSibling.style.backgroundImage =
          "url(" + bgSrc[prev] + ")";
        stage.nextElementSibling.style.backgroundImage =
          "url(" + bgSrc[next] + ")";
      }
    }
    function pos(prm){
      var next;
      var prev;
      next=(prm + 1) > 4 ? 0 : prm+1;
      prev=(prm - 1) < 0 ? 4 : prm-1;
      stage.style.backgroundImage = "url(" + bgSrc[prm] + ")";
      i=prm;
        stage.previousElementSibling.style.backgroundImage =
          "url(" + bgSrc[prev] + ")";
        stage.nextElementSibling.style.backgroundImage =
          "url(" + bgSrc[next] + ")";
    }