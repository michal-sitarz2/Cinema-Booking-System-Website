Rails.application.routes.draw do

  resources :movies
  root 'home#home'
  get 'home/webform'
  get 'home/restable'

  get 'movies/index'
  get 'addmovie', to: 'home#webform'
end
