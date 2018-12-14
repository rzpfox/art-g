// Get the modal
let modal = document.getElementById('wechat-qr-containter');

// Get the button that opens the modal
let btn = document.getElementById("wechat-btn");

// When the user clicks on the button, open the modal
btn.onclick = function() {
  if (modal.style.display === "block") {
    modal.style.display = "none";
  }
  else {
    modal.style.display = "block";
  }
}

// When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
//   if (event.target == modal) {
//     modal.style.display = "none";
//   }
// }
