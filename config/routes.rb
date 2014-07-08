Amber::Application.routes.draw do
  root to:'home#index'
  get 'beer_genres/search' => 'beer_genres#search'
  get 'beer_genres' => 'beer_genres#index'
  get 'beer_genres/:id/beers'=> 'beers#show'

  match 'beers/search' => 'beers#search' #TODO: test if this is necessary
  # match 'beer_genres/search' => 'beer_genres#search' #TODO: test if this is necessary
  resources :beers

  resources :users
  match 'sessions/new' => 'sessions#new'
  match 'sessions/create' => 'sessions#create'
  match 'sessions/exit' => 'sessions#exit'
end
