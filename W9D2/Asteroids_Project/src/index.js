const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

console.log("Tyreke Hill!!!")

const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});

console.log(mo)