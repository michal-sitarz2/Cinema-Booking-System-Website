Rails.application.routes.draw do

  resources :bookings, except: [:new, :edit, :show]
  resources :line_items, except: [:new, :edit, :index, :show]
  resources :carts, except: [:new,:edit,:index]
  resources :cinemas, except: [:show]
  resources :screenings, except: [:show]
  resources :movies, except: [:index]
  devise_for :users

  root 'home#home'
  get 'home/book_tickets'
  get 'home/restable'
  get 'home/contact'

  get 'contact', to: 'home#contact'
  get 'allresources', to: 'home#restable'
  get 'booking', to: 'home#book_tickets'

  post 'request_contact', to: 'home#request_contact'

  resources :carts do
    collection do
      post :create_booking
    end
  end


end
