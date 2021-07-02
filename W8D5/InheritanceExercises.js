function MovingObject (name) {
    this.name= name;
}

function Ship (name,yr) {
    this.name = name;
    this.yr = yr;
}
function Asteroid (size) {
    this.size = size;
}

MovingObject.prototype.sayhi = function(){
    console.log('hi');
}

Asteroid.prototype.saybye = function(){
    console.log("bye");
}

// function Surrogate() {}

// Surrogate.prototype = MovingObject.prototype;
// Ship.prototype = new Surrogate();
// Ship.prototype.constructor = Ship;

// Asteroid.prototype = new Surrogate();
// Asteroid.prototype.constructor = Asteroid;

Function.prototype.inherits = function(obj){
    function Surrogate(){}
    Surrogate.prototype = obj.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
    console.log(this)
}

Ship.inherits(MovingObject);
Asteroid.inherits(MovingObject);

const s1 = new Ship('Jaycee',2021);
s1.sayhi(); 
// s1.saybye();
const m1 = new MovingObject('Shirley');
m1.sayhi();

