$(function(){
  beersController = new Beer.Controller(new Beer.View())
  $('#search_results').on('click', '.beer_map_button', showZipForm)
  $('#beer_results').on('click', '.zip_code_button', yelpCall)
})