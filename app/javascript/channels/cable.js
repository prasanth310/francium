//= require action_cable

(function() {
    this.App || (this.App = {});
    App.cable = ActionCable.createConsumer();
} ).call(this);