Rails.application.routes.draw do
  get 'blogs/index'
  get 'incomes/new'
  get 'expenses/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users', to: 'users/registrations#new_user'
    post 'users/create_user', to: 'users/registrations#create_user'
  end
  
  root to: 'blogs#index'
  get 'expenses_by_month', to: 'blogs#expenses_by_month', as: 'expenses_by_month'
  resources :blogs, params: :date, only: [:show]
  resources :incomes
  resources :expenses
  resources :families
  
end
