Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  root 'home#index'
  resources :boards
  resources :comments, only: %i[create destroy]
end
