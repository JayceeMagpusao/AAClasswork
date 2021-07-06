const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

console.log("Tyreke Hill!!!")

mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 20,
  color: "#00FF00"
});

window.addEventListener('DOMContentLoaded', (event) => {
  
  console.log('DOM fully loaded and parsed');

  const canvas = document.getElementById('game-canvas')
  
  const ctx = canvas.getContext('2d')

  mo.draw(ctx);
});

window.addEventListener('click', (event) => {
  console.log('moved')

  const canvas = document.getElementById('game-canvas')
  
  const ctx = canvas.getContext('2d')

  mo.draw(ctx);
  mo.move(ctx);
})