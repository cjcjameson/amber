Amber.Router.map(function(){
  this.resource("beers", function(){
    this.resource("beer", { path: ":beer_id" });
  });
});