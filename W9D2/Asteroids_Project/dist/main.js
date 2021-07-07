/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\r\n\r\nfunction Asteroid(args){\r\n  this.pos = args.pos;\r\n  this.vel = Utility.randomVec(4);\r\n  this.radius = 50;\r\n  this.color = \"red\";\r\n}\r\n\r\nUtil.inherits(Asteroid, MovingObject);\r\n\r\n// Return a randomly oriented vector with the given length.\r\nconst Utility = {\r\n  randomVec(length) {\r\n    const deg = 2 * Math.PI * Math.random();\r\n    return Utility.scale([Math.sin(deg), Math.cos(deg)], length);\r\n  },\r\n  // Scale the length of a vector by the given amount.\r\n  scale(vec, m) {\r\n    return [vec[0] * m, vec[1] * m];\r\n  }\r\n};\r\n\r\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\n\r\nfunction Game(args){\r\n  this.dim_X = args.dim_X;\r\n  this.dim_Y = args.dim_Y;\r\n  this.NUM_ASTEROIDS = args.NUM_ASTEROIDS;\r\n  this.asteroids = [];\r\n};\r\n\r\nGame.prototype.addAsteroids = function(){\r\n  this.asteroids.push(new Asteroid({\r\n    pos: randomPosition()\r\n  }));\r\n}\r\nconst game = new Game({dim_X: 4, dim_Y: 4, NUM_ASTEROIDS: 2});\r\n\r\nfunction randomPosition() {\r\n  let x = Math.floor(Math.random(10)*10);\r\n  let y = Math.floor(Math.random(10)*10);\r\n\r\n  return [x, y]\r\n}\r\n\r\nGame.prototype.draw = function(ctx) {\r\n\r\n  ctx.fillStyle = \"black\"\r\n\r\n  ctx.fillRect(50, 50, this.dim_X, this.dim_Y);\r\n\r\n};\r\n\r\nGame.prototype.moveObjects = function(ctx){\r\n  for(let i = 0; i < this.asteroids.length; i++){\r\n    let current = this.asteroids[i];\r\n    current.move(ctx);\r\n\r\n    ctx.fillStyle = \"blue\";\r\n    ctx.fill();\r\n    // let x = current.pos[0] + current.vel[0];\r\n    // let y = current.pos[1] + current.vel[1];\r\n\r\n    // current.pos = [x, y]\r\n  }\r\n}\r\n\r\n\r\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\r\n\r\nwindow.MovingObject = MovingObject;\r\n\r\nmo = new MovingObject({\r\n  pos: [30, 30],\r\n  vel: [10, 10],\r\n  radius: 20,\r\n  color: \"#00FF00\"\r\n});\r\n\r\nasteroid = new Asteroid({\r\n  pos: [100, 100],\r\n});\r\n\r\ngame = new Game({\r\n  dim_X: document.body.clientWidth,\r\n  dim_Y: document.body.clientHeight,\r\n  NUM_ASTEROIDS: 8\r\n});\r\n\r\ngame.addAsteroids();\r\ngame.addAsteroids();\r\ngame.addAsteroids();\r\n\r\n\r\nwindow.addEventListener('DOMContentLoaded', (event) => {\r\n  \r\n  console.log('DOM fully loaded and parsed');\r\n\r\n  const canvas = document.getElementById('game-canvas')\r\n  \r\n  const ctx = canvas.getContext('2d')\r\n\r\n  game.draw(ctx);\r\n  mo.draw(ctx);\r\n  asteroid.draw(ctx);\r\n});\r\n\r\nwindow.addEventListener('click', (event) => {\r\n  console.log('moved')\r\n\r\n  const canvas = document.getElementById('game-canvas')\r\n  \r\n  const ctx = canvas.getContext('2d')\r\n\r\n  mo.draw(ctx);\r\n  mo.move(ctx);\r\n  game.moveObjects(ctx);\r\n})\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("module.exports = MovingObject;\r\n\r\nfunction MovingObject(args){\r\n  this.pos = args.pos;\r\n  this.vel = args.vel;\r\n  this.radius = args.radius;\r\n  this.color = args.color;\r\n}\r\n\r\nMovingObject.prototype.draw = function (ctx) {\r\n\r\n  ctx.beginPath();\r\n\r\n  ctx.arc(\r\n    this.pos[0], \r\n    this.pos[1],\r\n    this.radius, \r\n    0 ,\r\n    2 * Math.PI\r\n  );\r\n\r\n  ctx.fillStyle = this.color\r\n  ctx.fill();\r\n\r\n}\r\n\r\nMovingObject.prototype.move = function (ctx) {\r\n\r\n  let newPosition = []\r\n\r\n  newPosition.push(this.pos[0] + this.vel[0]);\r\n  newPosition.push(this.pos[1] + this.vel[1]);\r\n\r\n  this.pos = newPosition;\r\n\r\n  ctx.fillStyle = \"red\";\r\n  ctx.fill();\r\n}\r\n\r\n// const mo = new MovingObject({\r\n//   pos: [30, 30],\r\n//   vel: [100, 100],\r\n//   radius: 20,\r\n//   color: \"#00FF00\"\r\n// });\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\r\n  inherits(childClass, parentClass) {\r\n    function Surrogate() {};\r\n    Surrogate.prototype = parentClass.prototype;\r\n    childClass.prototype = new Surrogate();\r\n    childClass.prototype.constructor = childClass;\r\n  }\r\n};\r\n\r\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;