Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  get "profiles/:id/edit", to: 'profiles#edit'
 get 'reservations/new'
  get 'profiles/show'
  get 'users/profile'
  get 'reservations/new'
  post 'reservations/confirm'
  post 'reservations/back'
  post 'reservations/complete'
  
  
  resources :profiles

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
  get 'users/:id', to: 'users#account'
  resources :users
  resources :rooms
end
