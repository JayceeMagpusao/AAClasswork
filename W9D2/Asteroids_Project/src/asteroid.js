const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

function Asteroid(args){
  this.pos = args.pos;
  this.vel = Utility.randomVec(4);
  this.radius = 50;
  this.color = "red";
}

Util.inherits(Asteroid, MovingObject);

// Return a randomly oriented vector with the given length.
const Utility = {
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Utility.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Asteroid;