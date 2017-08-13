// var greeting = "hello";

// var banana = document.getElementById("display");
// banana.innerHTML = greeting;

// var change = banana;
// change.addEventListener("click",function() {
// 	changeColor();
// });

// function changeColor()
// {

// 	change.style.fontSize="100px";

// }

document.addEventListener('DOMContentLoaded',function()
{

var topNav = document.getElementById("myTopNav");
topNav.innerHTML += "<a href = 'index.html'>HOME</a>";
topNav.innerHTML += "<a href = 'index.html'>ABOUT</a>";
topNav.innerHTML += "<a href = 'index.html'>WORK</a>";
topNav.innerHTML += "<a href = 'index.html'>CONTACT</a>";

});

