Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, except: :destroy do
    resources :days, only: %i[create new]
    resources :bookings, only: %i[new create]
  end

  resources :days, only: %i[edit update]

  get "/profile", to: "pages#profile"
  get "/credits", to: "pages#credits"
  patch "/credits", to: "pages#purchase"
  get "/bookings/:id/confirm", to: "bookings#confirm", as: 'booking_confirmation'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
