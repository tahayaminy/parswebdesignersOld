const $ = (el) => {
  return document.getElementById(el);
};
var hourglassT;
var waves = document.getElementsByTagName("img");

const hourglassStart = () => {
  let H = eval($("min").value * 60) + eval($("sec").value);
  if (H != 0) {
    let h = H;
    for (let wave of waves) {
      wave.style.opacity = 1;
    }

    $("backwave").style.height = "100%";

    hourglassT = setInterval(() => {
      h -= 1;
      $("backwave").style.height = (h * 100) / H + "%";
      if (h == 0) {
        hourglassEnd();
        for (let wave of waves) {
          wave.style.opacity = 0;
        }
      }
    }, 1000);

    $("hourglass-start").style.display="none";
    $("hourglass-end").style.display="inline-block";
  }
};
const hourglassEnd = () => {
  clearInterval(hourglassT);
  $("hourglass-start").style.display="inline-block";
  $("hourglass-end").style.display="none";
};

var hourglass = document.getElementsByClassName("hourglass");
var stopwatch = document.getElementsByClassName("stopwatch");
const change = (srv) => {
  if (srv == true) {
    for (let ex of stopwatch) {
      ex.style.display = "none";
    }
    for (let ex of hourglass) {
      ex.style.display = "block";
    }
  } else if (srv == false) {
    for (let ex of stopwatch) {
      ex.style.display = "block";
    }
    for (let ex of hourglass) {
      ex.style.display = "none";
    }
  }
};
var arr = [0, 0, 0, 0, 0];
var stopwatchT;
var state = true;
const SE = () => {
  if (state) {
    state = false;
    stopwatchT = setInterval(() => {
      if (arr[4] == 9) {
        arr[4] = 0;
        $("s01").innerText = arr[4];
        $("s10").innerText = ++arr[3];
        if (arr[3] == 6) {
          arr[3] = 0;
          $("s10").innerText = arr[3];
          $("m01").innerText = ++arr[2];
          if (arr[2] == 9) {
            arr[2] = 0;
            $("m01").innerText = arr[2];
            $("m10").innerText = ++arr[1];
            if (arr[1] == 6) {
              arr[1] = 0;
              $("m10").innerText = arr[1];
              $("h").innerText = ++arr[0];
            }
          }
        }
      } else {
        $("s01").innerText = ++arr[4];
      }
    }, 1000);
  } else {
    clearInterval(stopwatchT);
    arr = [0, 0, 0, 0, 0];
    $("s01").innerText = 0;
    $("s10").innerText = 0;
    $("m01").innerText = 0;
    $("m10").innerText = 0;
    $("h").innerText = 0;
    state = true;
  }
};
