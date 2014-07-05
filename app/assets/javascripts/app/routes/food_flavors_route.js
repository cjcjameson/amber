Amber.FoodFlavorsRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('food_flavor');
  }
})