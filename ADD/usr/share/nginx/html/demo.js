function update_message() {
    fetch("map/message.html")
    .then((response) => response.text())
    .then((html) => {
        document.getElementById("content").innerHTML = html;
    })
    .catch((error) => {
        console.warn(error);
    });
} 

var interval = setInterval(function(){ 
    update_message();
}, 5000);
