function choose(choosen) {
    var vue=document.getElementById('vue');
    var [file]=choosen.files;
    vue.src=URL.createObjectURL(file);
    vue.style.display='block';
}