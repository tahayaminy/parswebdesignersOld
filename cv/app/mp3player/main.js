var song = document.getElementById("song");
    var timing;
    var pause = document.getElementById("pause");
    var bar = document.getElementsByClassName("bar");

    function play() {
      pause.style.display = "inline";
      pause.previousElementSibling.style.display = "none";
      song.play();
      timing = setInterval(updateProgressValue, 500);
      for (var i = 0; i < bar.length; i++) {
        bar[i].style.animationName = "animate";
      }
    }
    function paused() {
      pause.style.display = "none";
      pause.previousElementSibling.style.display = "inline";
      song.pause();
      clearInterval(timing);
      for (var i = 0; i < bar.length; i++) {
        bar[i].style.animationName = "none";
      }
    }

    var progressBar = document.getElementById("overlay");

    function updateProgressValue() {
      progressBar.max = Math.floor(song.duration);
      progressBar.value = Math.floor(song.currentTime);

      document.querySelector("#currentTime").innerHTML = count(
        progressBar.value
      );

      document.querySelector("#durationTime").innerHTML = count(
        progressBar.max
      );

      if (progressBar.max == progressBar.value) {
        pause.style.display = "none";
        pause.previousElementSibling.style.display = "inline";
        progressBar.value = 0;
        document.querySelector("#currentTime").innerHTML = count(
        progressBar.value
        );
        for (var i = 0; i < bar.length; i++) {
          bar[i].style.animationName = "none";
        }
      }
    }
    function changeProgress() {
      song.currentTime = progressBar.value;
    }
    function stop() {
      pause.style.display = "none";
      pause.previousElementSibling.style.display = "inline";
      progressBar.value = 0;
      song.pause();
      song.currentTime = 0;
      document.querySelector("#currentTime").innerHTML = count(
        progressBar.value
      );
      for (var i = 0; i < bar.length; i++) {
        bar[i].style.animationName = "none";
      }
    }

    function count(time) {
      var min = 0;
      var sec = 0;
      if (time < 60) {
        sec = "0:" + time;
        return sec;
      } else {
        var tix = 0;
        var tiy = 0;

        tix = time;

        time = Math.floor(time / 60);
        min = time;

        tiy = min * 60;
        sec = tix - tiy;
        var FT;
        FT = min + ":" + sec;
        return FT;
      }
    }