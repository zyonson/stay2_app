Rails.application.routes.draw do
  get 'rooms/top', to: "rooms#top"
  get 'rooms/index'
  get 'rooms/register', to: 'rooms#register'
  get "profiles/edit", to: 'profiles#edit'
  get 'profiles/show'
  get 'users/profile'
  get 'reservations/new'
  post 'reservations/confirm'
  post 'reservations/back'
  get 'reservations/index'
  get 'search' => 'rooms#search'
  
  
  resources :profiles
  resources :reservations
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauthable_callbacks => "users/omniauthable_callbacks" 
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'users/account', to: 'users#account'
  resources :users
  resources :rooms
end
