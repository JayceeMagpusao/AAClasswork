const { Module } = require("webpack");

class FollowToggle {
  constructor(el){
    this.$el = $(el);
    const $button = $("button.follow-toggle");
    this.userId = $button.data("user-id");
    this.followState = $button.data("data-initial-follow-state");
    console.log($button);
    this.render();
  }

  render(){
    if(this.followState === "Followed"){
      this.$el.innerHTML = "Follow"
    } else{
      this.$el.innerHTML = "Unfollow"
    }
  }

  handleClick(click) {
    click.preventDefault();
  }
}

Module.exports = FollowToggle;