var song = document.getElementById('song');

function details(dir) {
    var srcimg = dir.querySelector('div img').getAttribute('src');
    var name = dir.querySelector('div div h4').innerText;
    var time = dir.querySelector('div div audio').duration;
    var srcaudio = dir.querySelector('div div audio').getAttribute('src');
    document.getElementById('textplace').innerText = dir.querySelector('span').innerText;
    document.getElementById('yearplace').innerText = dir.querySelector('b').innerText;


    document.getElementById('exampleModalLabel').innerHTML = name;
    document.getElementById('img-modal').setAttribute('src', srcimg);
    document.getElementById('song').setAttribute('src', srcaudio);
    document.getElementById('down').setAttribute('href', srcaudio);
}

var timing;

function play(d) {
    d.classList.add('d-none');
    d.nextElementSibling.classList.remove('d-none');
    song.play();
    timing = setInterval(updateProgressValue, 500);
}

function pause(d) {
    d.classList.add('d-none');
    d.previousElementSibling.classList.remove('d-none');
    song.pause();
    clearInterval(timing);
}


var progressBar = document.getElementById('progress-bar');



function updateProgressValue() {
    progressBar.max = Math.floor(song.duration);
    progressBar.value = Math.floor(song.currentTime);

    document.querySelector('.currentTime').innerHTML = count(progressBar.value);

    document.querySelector('.durationTime').innerHTML = count(progressBar.max);

    if (progressBar.max == progressBar.value) {
        document.getElementById('play').classList.remove('d-none');
        document.getElementById('pause').classList.add('d-none');
        progressBar.value = 0;
    }

}

function changeProgress() {
    song.currentTime = progressBar.value;
}


function count(time) {
    var min = 0;
    var sec = 0;
    if (time < 60) {
        sec = '0:' + time;
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

function closemodal() {
    progressBar.value = 0;
    changeProgress();
    document.getElementById('play').classList.remove('d-none');
    document.getElementById('pause').classList.add('d-none');
    song.pause();
}