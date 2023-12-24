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
  resources :blogs, params: :date, only: [:show] do
    collection do
      get 'expenses_by_month'
    end
  end
  resources :incomes
  resources :expenses
  resources :families
  resources :users, only: :show
  
end
