$(function(){
  beersController = new BeersController(new View())
  $('#search_results').on('click', '.beer_map_button', showZipForm)
  $('#beer_results').on('click', '.zip_code_button', yelpCall)
  $('.back_button').click(function(){
     $('html,body').animate({ scrollTop: $($(this).attr("href")).offset().top }, 'slow','swing');
     return false;
     })
})