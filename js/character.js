function checklength(dis){
    if(dis){var str=dis.value;}else{var str=document.getElementById('description').value;}
    document.getElementById('length').innerText=str.length;
}