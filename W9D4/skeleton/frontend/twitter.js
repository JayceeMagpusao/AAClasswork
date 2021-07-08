const FollowToggle = require("./follow_toggle");

$(".follow-toggle").each(function(i, cb) {
  new FollowToggle(cb);
})