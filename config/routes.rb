Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, except: :destroy do
    resources :days, only: %i[create new]
    resources :bookings, only: %i[new create] do
      resources :payments, only: :new
    end
  end

  resources :days, only: %i[edit update]

  post "/likes", to: "users#like"
  post "/unlikes", to: "users#unlike"
  get "/profile", to: "pages#profile"
  get "/credits", to: "pages#credits"
  patch "/credits", to: "pages#purchase"
  get "/bookings/:id/confirm", to: "bookings#confirm", as: 'booking_confirmation'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  get "days/:id/edit2", to: "days#edit", as: "edit_day2"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
