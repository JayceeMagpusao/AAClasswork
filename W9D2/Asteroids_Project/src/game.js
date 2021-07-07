const Asteroid = require("./asteroid.js");

function Game(args){
  this.dim_X = args.dim_X;
  this.dim_Y = args.dim_Y;
  this.NUM_ASTEROIDS = args.NUM_ASTEROIDS;
  this.asteroids = [];
};

Game.prototype.addAsteroids = function(){
  this.asteroids.push(new Asteroid({
    pos: randomPosition()
  }));
}
const game = new Game({dim_X: 4, dim_Y: 4, NUM_ASTEROIDS: 2});

function randomPosition() {
  let x = Math.floor(Math.random(10)*10);
  let y = Math.floor(Math.random(10)*10);

  return [x, y]
}

Game.prototype.draw = function(ctx) {

  ctx.fillStyle = "black"

  ctx.fillRect(50, 50, this.dim_X, this.dim_Y);

};

Game.prototype.moveObjects = function(ctx){
  for(let i = 0; i < this.asteroids.length; i++){
    let current = this.asteroids[i];
    current.move(ctx);

    ctx.fillStyle = "blue";
    ctx.fill();
    // let x = current.pos[0] + current.vel[0];
    // let y = current.pos[1] + current.vel[1];

    // current.pos = [x, y]
  }
}

module.exports = Game;