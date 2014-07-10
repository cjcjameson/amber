Maps.Controller = function(view){
  this.view = view
  this.initalizeEvents()
  this.addressList = []
}

Maps.Controller.prototype = {
  initalizeEvents: function(){
    mapController = this;
    $('#search_results').on('click', '.beer_map_button', this.showZipForm.bind(this))
    $('#beer_results').on('click', '.zip_code_button', this.yelpCall.bind(this))
  },

  showZipForm: function(event) {
    var genre_id = event.target.dataset.id
    var beerGenreController = new BeerGenres.Controller(new BeerGenres.View())
    zipcodeController = new Zipcodes.Controller(new Zipcodes.View(), genre_id)
  },

  yelpCall: function(event){
    var genre_id = event.target.dataset.id
    var beerGenreController = new BeerGenres.Controller(new BeerGenres.View())
    var zipcode = $('#zipcode').val()
    event.preventDefault();
    $.ajax({
      url: '/location_lookup/result',
      method: 'get',
      data: {genre: genre_id, zipcode: zipcode},
      dataType: 'json'
    }).done(function(data){
      this.initializeMaps(data, zipcodeController)
    }.bind(this)).fail(function(data){
      zipcodeController.view.regenerateForm(data)
    })
  },

  initializeMaps: function(data, zipCon) {
    zipCon.view.clearForm()
    this.view.createCanvas()
    var mapModel = new Map(data)
    map = new google.maps.Map(document.getElementById("map-canvas"), mapModel.mapOptions);
    var locationController = new Locations.Controller(new Locations.View(),data.data)
    var infoWindow = new google.maps.InfoWindow({
            content: "..."
          });
    locationController.plotLocations(infoWindow, mapModel, map)
  }
  
}






