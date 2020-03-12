Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resources :studios
  resources :events, only: [:new, :create, :edit, :update, :destroy]
  resources :offers, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :after_signup

  resources :users, only: [:show] do
    resources :events, only: [:index]
    resources :offers, only: [:index]
  end

  # get 'home' => 'users#home', as: :home
  post 'landing_email' => 'users#landing_email', as: :landing_email
  get 'forgot_password' => 'users#forgot_password', as: :forgot_password
  get 'pre_launch_landing' => 'users#pre_launch_landing', as: :pre_launch_landing
  get 'pre_launch_reservation' => 'users#pre_launch_reservation', as: :pre_launch_reservation
  get 'verification' => 'users#verification', as: :verification
  get 'my_trainers' => 'users#my_trainers', as: :my_trainers
  get 'settings' => 'user#settings', as: :settings
  get 'profile' => 'user#profile', as: :profile
  get 'manage_trainers' => 'studio#manage_trainers', as: :manage_trainers
  get 'manage_events' => 'studio#manage_events', as: :manage_events

  root to: 'users#home'
end
