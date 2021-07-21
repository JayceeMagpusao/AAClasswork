import {receiveTodos, receiveTodo, removeTodo} from './frontend/actions/todo_actions';
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store'



document.addEventListener('DOMContentLoaded', ()=>{
    const store = configureStore();
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo = removeTodo;

    
})


