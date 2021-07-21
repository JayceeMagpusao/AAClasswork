import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from "../actions/step_actions"

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

const stepsReducer = (oldState = initialState, action) => {
  Object.freeze(oldState);
  const nextState = Object.assign({}, oldState);
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach((ele)=>{
        nextState[ele.id] = ele;
      })
    return nextState;
    // return the todos from the action
    case RECEIVE_STEP:
      nextState[action.step.id] = action.step;
      return nextState;

    case REMOVE_STEP:
      delete nextState[action.step.id];
      return nextState;
    default:
      return oldState;
  }
};

export default stepsReducer;