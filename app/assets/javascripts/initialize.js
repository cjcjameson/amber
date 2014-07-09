$(function(){
  beersController = new BeersController(new View($('#beer_results')))

  /* Not really related to Beer listing, more about maps and things like that*/
  $('#search_results').on('click', '.beer_map_button', showZipForm)
  $('#beer_results').on('click', '.zip_code_button', yelpCall)
})
