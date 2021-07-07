function sum(){
  let sum = 0;
  let arr = Array.from(arguments);

  arr.forEach((ele) => sum = ele + sum);

  return sum;
}

function sum2(...args){
  let sum = 0;
  args.forEach((ele) => sum = ele + sum);

  return sum;
}

// console.log(sum2(1, 2, 3, 4)) //=== 10;
// console.log(sum2(1, 2, 3, 4, 5)) //=== 15;

//need to use this ES5 style for the test
Function.prototype.myBind = function(ctx){
    let bindArgs = Array.from(arguments).slice(1);
    let that = this;

    return function(){
      let callArgs = Array.from(arguments);
      return that.apply(ctx, array.concat(array2));
    }
}

Function.prototype.myBind = function(ctx, ...bindArgs) {
	return (...callArgs) => {
		return this.apply(ctx, bindArgs.concat(callArgs))
	}
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


function curriedSum(numArgs) {
  const numbers = [];
  
  
	return function _curriedSum(num){
    if (numbers.length === numArgs){
      return;
    }
    numbers.push(num);
    let result = numbers.reduce((acc, el) => acc + el);
    console.log(result);
    return _curriedSum;//very important NOT to invoke here
	}
}



// you'll write `Function#curry`!


// const total = curriedSum(4);
// total(5)(30)(20)(1); // => 56
function sumThree(...nums) {
  let total = 0;

  for(let i = 0; i < nums.length; i++){
    total += nums[i];
  }
  return total;
}

Function.prototype.curry = function(numArgs){
  let args = [];
  let that = this;

  return function _curry(num){
    args.push(num)
    if (args.length === numArgs){
      return that.apply(null, args);
    } else {
      return _curry;
    }
  }
}

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1)

sumThree.curry(4, 20, 6); // == 30
// or more briefly:
// sumThree.curry(3)(4)(20); // == 30