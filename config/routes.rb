Rails.application.routes.draw do
  get "/profiles/:id/edit", to: 'profiles#edit'
 
  get 'profiles/show'
  get 'users/profile'
  get 'users/account'
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

end
