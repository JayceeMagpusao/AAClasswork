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

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\n\r\nwindow.MovingObject = MovingObject;\r\n\r\nconsole.log(\"Tyreke Hill!!!\")\r\n\r\nmo = new MovingObject({\r\n  pos: [30, 30],\r\n  vel: [10, 10],\r\n  radius: 20,\r\n  color: \"#00FF00\"\r\n});\r\n\r\nwindow.addEventListener('DOMContentLoaded', (event) => {\r\n  \r\n  console.log('DOM fully loaded and parsed');\r\n\r\n  const canvas = document.getElementById('game-canvas')\r\n  \r\n  const ctx = canvas.getContext('2d')\r\n\r\n  mo.draw(ctx);\r\n});\r\n\r\nwindow.addEventListener('click', (event) => {\r\n  console.log('moved')\r\n\r\n  const canvas = document.getElementById('game-canvas')\r\n  \r\n  const ctx = canvas.getContext('2d')\r\n\r\n  mo.draw(ctx);\r\n  mo.move(ctx);\r\n})\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("module.exports = MovingObject;\r\n\r\nfunction MovingObject(args){\r\n  this.pos = args.pos;\r\n  this.vel = args.vel;\r\n  this.radius = args.radius;\r\n  this.color = args.color;\r\n}\r\n\r\nMovingObject.prototype.draw = function (ctx) {\r\n\r\n  ctx.beginPath();\r\n\r\n  ctx.arc(\r\n    this.pos[0], \r\n    this.pos[1],\r\n    this.radius, \r\n    0 ,\r\n    2 * Math.PI\r\n  );\r\n\r\n  ctx.fillStyle = this.color\r\n  ctx.fill();\r\n\r\n}\r\n\r\nMovingObject.prototype.move = function (ctx) {\r\n\r\n  let newPosition = []\r\n\r\n  newPosition.push(this.pos[0] + this.vel[0]);\r\n  newPosition.push(this.pos[1] + this.vel[1]);\r\n\r\n  this.pos = newPosition;\r\n\r\n  ctx.fillStyle = \"red\";\r\n  ctx.fill();\r\n}\r\n\r\n// const mo = new MovingObject({\r\n//   pos: [30, 30],\r\n//   vel: [100, 100],\r\n//   radius: 20,\r\n//   color: \"#00FF00\"\r\n// });\n\n//# sourceURL=webpack:///./src/moving_object.js?");

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