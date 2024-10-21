var character = document.getElementById("character");
var bullet = document.getElementById("bullet");
var dead = document.getElementById("dead");
var win = document.getElementById("win");
var restart = document.getElementById("restart");
var start = document.getElementById("start");
var shooter = document.getElementById("shooter");
var playerimg = document.getElementById("playerimg");

function jump(){
    if(character.classList != "up")
        character.classList.add("up");
    setTimeout(function(){
        character.classList.remove("up"); 
    },800)
}

function moveRight(){
    var left=parseInt(window.getComputedStyle(character).getPropertyValue("left"));
    if(left<900)
        character.style.left = left + 20 + "px";
}

function moveLeft(){
    var left=parseInt(window.getComputedStyle(character).getPropertyValue("left"));
    if(left>0)
        character.style.left = left - 20 + "px";
}

var checkDead = setInterval(function(){

    const playerPosition = character.getBoundingClientRect();
    const bulletPosition = bullet.getBoundingClientRect();
    const shooterPosition = shooter.getBoundingClientRect();
    if (
        playerPosition.left < bulletPosition.right &&
        playerPosition.right > bulletPosition.left &&
        playerPosition.top < bulletPosition.bottom &&
        playerPosition.bottom > bulletPosition.top
    ) {
        bullet.style.animation = "none";
        bullet.style.display = "none";
        character.style.display= "none";
        dead.style.display = "block";
        restart.style.display = "block";
    }
    if (
        playerPosition.left < shooterPosition.right &&
        playerPosition.right > shooterPosition.left &&
        playerPosition.top < shooterPosition.bottom &&
        playerPosition.bottom > shooterPosition.top
    ) {
        bullet.style.animation = "none";
        bullet.style.display = "none";
        win.style.display = "block";
        restart.style.display = "block";
        // chnage img src to dead img.
        playerimg.src = "svg/karate.png";
    }
},100); 

function Restart(){
    setTimeout(function(){
        location.reload();
    },100); 
}

function StartGame(){
    setTimeout(function(){
        start.style.display="none";
        bullet.style.animation = "shot 1.2s infinite linear ";
    },500);
};



 