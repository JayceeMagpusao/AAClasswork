import React from 'react';

class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      time: new Date()
    }
    this.tick = this.tick.bind(this)
  }
  
  tick() {
    let second = this.state.time
    this.setState({time: second + 1})
  }

  componentDidMount() {
    setInterval(this.tick, 1000)
  }
  
  render () {
    const hours = this.state.time.getHours()
    const minutes = this.state.time.getMinutes()
    const seconds = this.state.time.getSeconds()
    return (
      <h1>{hours}:{minutes}:{seconds}</h1>
      )
    }
  }


export default Clock;