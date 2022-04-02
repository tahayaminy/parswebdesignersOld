const $ = (el) => {
  return document.getElementById(el);
};
const number = "1234567890";
const letter = "abcdefghigklmnopqrstuvwxyz";
const caps = "ABCDEFGHIGKLMNOPQRSTUVWXYZ";
const symbol = `!"#$%&'()*+,-./:;<=>?@[]^_\`{|}~ `;

var i;

function createPass() {
  var strpass = "";
  for (let radio of document.getElementsByName("char")) {
    if (radio.checked) {
      var checked = 0;
      var length;
      if (radio.value == 8) {
        if ($("number").checked) {
          checked++;
        }
        if ($("letter").checked) {
          checked++;
        }
        if ($("caps").checked) {
          checked++;
        }
        if ($("symbol").checked) {
          checked++;
        }
        length = Math.ceil(8 / checked);

        for (let j = 1; j <= length; j++) {
          if ($("number").checked) {
            i = Math.round(Math.random() * (9 - 0)) + 0;
            strpass += number[i];
          }
          if ($("letter").checked) {
            i = Math.round(Math.random() * (25 - 0)) + 0;
            strpass += letter[i];
          }
          if ($("caps").checked) {
            i = Math.round(Math.random() * (25 - 0)) + 0;
            strpass += caps[i];
          }
          if ($("symbol").checked) {
            i = Math.round(Math.random() * (31 - 0)) + 0;
            strpass += symbol[i];
          }
        }
      } else if (radio.value == 12) {
        if ($("number").checked) {
          checked++;
        }
        if ($("letter").checked) {
          checked++;
        }
        if ($("caps").checked) {
          checked++;
        }
        if ($("symbol").checked) {
          checked++;
        }
        length = Math.ceil(12 / checked);
        for (let j = 1; j <= length; j++) {
          if ($("number").checked) {
            i = Math.round(Math.random() * (9 - 0)) + 0;
            strpass += number[i];
          }
          if ($("letter").checked) {
            i = Math.round(Math.random() * (25 - 0)) + 0;
            strpass += letter[i];
          }
          if ($("caps").checked) {
            i = Math.round(Math.random() * (25 - 0)) + 0;
            strpass += caps[i];
          }
          if ($("symbol").checked) {
            i = Math.round(Math.random() * (31 - 0)) + 0;
            strpass += symbol[i];
          }
        }
      }
    }
  }
  $("output").value = strpass;
}
function copyPass() {
  /* Get the text field */
  var copyText = document.getElementById("output");

  /* Select the text field */
  copyText.select();
  copyText.setSelectionRange(0, 99999); /* For mobile devices */

  /* Copy the text inside the text field */
  navigator.clipboard.writeText(copyText.value);

  /* Alert the copied text */
  $("output").value = "PassWord copied!";
}
