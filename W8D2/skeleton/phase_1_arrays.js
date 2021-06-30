Array.prototype.unique = function() {
  let results = [];

  for(let i = 0; i < this.length; i++){
    let element = this[i];
    if(!results.includes(element)) {
      results.push(element);
    }
  }
  return results;
};

Array.prototype.twoSum = function(){
  let results = [];

  for(let i = 0; i <this.length; i++){
    let ele1 = this[i];
    for(let j = i + 1; j < this.length; j++){
      let ele2 = this[j];
      if (ele1 + ele2 === 0 ){
        results.push([i, j]);
      } 
    }
  }
  return results;
};

Array.prototype.transpose = function(){
  let results = Array.from({length: this[0].length}, ()=>Array.from({length: this.length}));

  for(let i = 0; i < this.length; i++){
    for(let j = 0; j < this[i].length; j++){
      results[j][i] = this[i][j]
    }
  }
  return results;
};