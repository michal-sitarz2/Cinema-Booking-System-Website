Rails.application.routes.draw do

  resources :line_items, except: [:new, :edit, :index, :show]
  resources :carts, except: [:new,:edit,:index]
  devise_for :users
  resources :cinemas, except: [:show]
  resources :screenings, except: [:show]
  resources :movies, except: [:index]

  root 'home#home'
  get 'home/book_tickets'
  get 'home/restable'
  get 'home/contact'

  get 'contact', to: 'home#contact'
  get 'allresources', to: 'home#restable'
  get 'booking', to: 'home#book_tickets'

  post 'request_contact', to: 'home#request_contact'


end
