import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions"

const initialState = {
  todos: {
    1: {
      id: 1,
      title: 'take a shower',
      body: 'and be clean',
      done: false
    }
  },
  steps: {
    1: { // this is the step with id = 1
      id: 1,
      title: 'walk to store',
      done: false,
      todo_id: 1
    },
    2: { // this is the step with id = 2
      id: 2,
      title: 'buy soap',
      done: false,
      todo_id: 1
    }
  }
}

const todosReducer = (oldState = initialState, action) => {
  Object.freeze(oldState);
  const nextState = Object.assign({}, oldState);
  switch (action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((ele)=>{
        nextState[ele.id] = ele;
      })
    return nextState;
    // return the todos from the action
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;

    case REMOVE_TODO:
      delete nextState[action.todo.id];
      return nextState;
    default:
      return oldState;
  }
};

export default todosReducer;