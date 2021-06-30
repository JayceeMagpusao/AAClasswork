const NUMS = [1,2,3,4,5]

Array.prototype.myEach = function(callback) {
  this.forEach(callback);
};

NUMS.myEach((element) => {
  return element * element
})

Array.prototype.myMap = function(callback) {
  let results = [];
  this.myEach((num) => {
    results.push(callback(num))
  });
  return results;
}

const squared = function(num){
  return num * num;
}

Array.prototype.myReduce = function(callback, val){
  let array = this;

  if (val === undefined){
    val = array[0];
    array.shift();
  };

  
  let accum = val;

  array.myEach((ele) => {
    accum = callback(accum, ele)
  })

  return accum;
}