import React from 'react';
import allTodos from '../../reducers/selectors';

class TodoList extends React.Component {

    render() {
    const {todos, receiveTodo} = this.props;
    //const items = [];
    // todos.forEach(todo =>{
    //     console.log(todo);
    // })
    // console.log(items);
    const items = todos.map(todo => (
        todo = todo
        //console.log(todo);
        // 
        //console.log(todo);
    ));

    console.log(items);
    
        return (
            <div>
                <ul className="todo-list">
                    {/* {items} */}
                </ul>
            </div>
        );
    }
}

export default TodoList;