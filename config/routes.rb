Rails.application.routes.draw do

  resources :movies
  root 'home#home'
  get 'movies/index'
  get 'home/webform'
  get 'home/restable'
  
end
