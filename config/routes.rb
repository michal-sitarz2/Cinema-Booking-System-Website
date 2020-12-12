Rails.application.routes.draw do

  resources :bookings, except: [:new, :edit, :show, :update, :update]
  resources :line_items, except: [:new, :edit, :index, :show, :update, :update]
  resources :carts, except: [:new,:edit,:index]
  resources :cinemas, except: [:show]
  resources :screenings, except: [:show]
  resources :movies, except: [:index]
  devise_for :users

  resources :carts do
    collection do
      post :create_booking
    end
  end

  root 'home#home'
  get 'home/book_tickets'
  get 'home/restable'
  get 'home/contact'

  get 'contact', to: 'home#contact'
  get 'allresources', to: 'home#restable'
  get 'booking', to: 'home#book_tickets'

  post 'request_contact', to: 'home#request_contact'
end
