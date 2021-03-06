Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resources :studios
  resources :events, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :offers, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :after_signup

  resources :users, only: [:show] do
    resources :events, only: [:index]
    resources :offers, only: [:index]
    resources :trainer_studios
    resources :user_studios
  end

  resources :studios do
    resources :trainer_studios
    resources :user_studios
  end

  get 'home' => 'users#home', as: :home
  post 'landing_email' => 'users#landing_email', as: :landing_email
  get 'forgot_password' => 'users#forgot_password', as: :forgot_password
  get 'welcome' => 'users#welcome', as: :welcome
  get 'verification' => 'users#verification', as: :verification
  get 'my_trainers' => 'users#my_trainers', as: :my_trainers
  get 'settings' => 'users#settings', as: :settings
  get 'profile' => 'users#profile', as: :profile
  get 'bio' => 'users#bio', as: :bio
  get 'manage_trainers' => 'studios#manage_trainers', as: :manage_trainers
  get 'manage_events' => 'events#manage_events', as: :manage_events
  get 'manage_offers' => 'offers#manage_offers', as: :manage_offers


  root to: 'users#home'
end
