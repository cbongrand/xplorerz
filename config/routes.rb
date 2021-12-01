Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, only: %i[create new show index] do
    resources :days, only: %i[create new edit update]
    resources :bookings, only: [:new]
  end

  get "/profile", to: "pages#profile"
  get "/credits", to: "pages#credits"
  patch "/credits", to: "pages#purchase"
  get "/confirmation/booking_id", to: "bookings#confirm"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
