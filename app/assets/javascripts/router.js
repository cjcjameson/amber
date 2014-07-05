Amber.Router.map(function(){
  this.resource("food_flavors", { path: "/" });
  this.resource("beers", function(){
    this.resource("beer", { path: ":beer_id" });
  });
});