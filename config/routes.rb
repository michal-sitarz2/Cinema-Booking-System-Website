Rails.application.routes.draw do

  resources :cinemas
  resources :screenings
  resources :actors
  resources :movies

  root 'home#home'
  get 'home/webform'
  get 'home/restable'
  get 'movies/index'

  get 'contact', to: 'home#contact'
  get 'addmovie', to: 'home#webform'
  get 'allresources', to: 'home#restable'

  post 'request_contact', to: 'home#request_contact'


end
