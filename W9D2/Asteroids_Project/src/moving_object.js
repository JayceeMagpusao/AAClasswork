module.exports = MovingObject;

function MovingObject(args){
  this.pos = args.pos;
  this.vel = args.vel;
  this.radius = args.radius;
  this.color = args.color;
}

MovingObject.prototype.draw = function (ctx) {

  ctx.beginPath();

  ctx.arc(
    this.pos[0], 
    this.pos[1],
    this.radius, 
    0 ,
    2 * Math.PI
  );

  ctx.fillStyle = this.color
  ctx.fill();

}

MovingObject.prototype.move = function (ctx) {

  let newPosition = []

  newPosition.push(this.pos[0] + this.vel[0]);
  newPosition.push(this.pos[1] + this.vel[1]);

  this.pos = newPosition;

  ctx.fillStyle = "red";
  ctx.fill();
}

// const mo = new MovingObject({
//   pos: [30, 30],
//   vel: [100, 100],
//   radius: 20,
//   color: "#00FF00"
// });