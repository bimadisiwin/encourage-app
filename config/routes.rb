Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
  root 'home#index'
  resources :boards
  resources :comments, only: %i[create destroy]
end
