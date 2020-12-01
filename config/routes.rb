Rails.application.routes.draw do

  resources :cinemas
  resources :screenings
  resources :actors
  resources :movies

  root 'home#home'
  get 'home/book_tickets'
  get 'home/restable'

  get 'contact', to: 'home#contact'
  get 'allresources', to: 'home#restable'
  get 'booking', to: 'home#book_tickets'

  post 'request_contact', to: 'home#request_contact'


end
