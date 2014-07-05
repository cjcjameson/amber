Amber.BeersRoute = Ember.Route.extend({
  model: function(){
    return this.store.findAll('beer');
  }
});