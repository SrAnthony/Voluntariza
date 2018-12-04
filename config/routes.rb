Rails.application.routes.draw do
  root 'events#index'

  get 'companies/new'
  post 'companies' => 'companies#create'

  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
