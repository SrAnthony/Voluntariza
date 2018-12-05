Rails.application.routes.draw do
  root 'events#index'

  get 'companies/new'
  post 'companies' => 'companies#create'

  get 'volunteers/new'
  post 'volunteers' => 'volunteers#create'

  # Seleção de tipo de conta - empresa ou voluntário
  get 'account/select' => 'users#account', as: :user_account_select

  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
