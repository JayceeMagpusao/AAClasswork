const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");

window.MovingObject = MovingObject;

mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 20,
  color: "#00FF00"
});

asteroid = new Asteroid({
  pos: [100, 100],
});

game = new Game({
  dim_X: document.body.clientWidth,
  dim_Y: document.body.clientHeight,
  NUM_ASTEROIDS: 8
});

game.addAsteroids();
game.addAsteroids();
game.addAsteroids();


window.addEventListener('DOMContentLoaded', (event) => {
  
  console.log('DOM fully loaded and parsed');

  const canvas = document.getElementById('game-canvas')
  
  const ctx = canvas.getContext('2d')

  game.draw(ctx);
  mo.draw(ctx);
  asteroid.draw(ctx);
});

window.addEventListener('click', (event) => {
  console.log('moved')

  const canvas = document.getElementById('game-canvas')
  
  const ctx = canvas.getContext('2d')

  mo.draw(ctx);
  mo.move(ctx);
  game.moveObjects(ctx);
})