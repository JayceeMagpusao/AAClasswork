const { Module } = require("webpack");

class FollowToggle {
  constructor(){
    this.userId = $("data-user-id");
    this.followState = $("data-initial-follow-state");
  }
}

Module.exports = FollowToggle;