Rails.application.routes.draw do

  resources :actors
  resources :movies
  root 'home#home'
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  
  get 'movies/index'
  get 'addmovie', to: 'home#webform'

  get 'home/webform'
  get 'home/restable'
end
