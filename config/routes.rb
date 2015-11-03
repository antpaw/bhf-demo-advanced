Rails.application.routes.draw do
  
  # bhf can be found at /bhf
  mount Bhf::Engine, at: 'bhf'
  
  # login is given to bhf via initializers/bhf.rb, the auth logic is defined in admin_controller
  resource :user_session, only: [:new, :create, :destroy]
  get    :login,  to: 'user_sessions#new'
  match  :logout, to: 'user_sessions#logout', via: [:get, :post, :delete]
  
  # the database reset button in the footer links via this
  get 'reset_database', to: 'application#reset_database'
  
  root 'application#index'

end
