Rails.application.routes.draw do

  root to: 'web/admin/welcome#index'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :watchers
      resources :patients
      resources :histories
      resources :statuses, only: :show
      resources :checklists
      resources :contacts
      resources :help_addresses
      resources :diets
    end
  end

  scope module: :web do
    namespace :admin do
      resource :session, only: [:new, :create, :destroy]
      resources :admins
      resources :statuses
      resources :watchers
      resources :patients
      resources :categories
      resources :usefulvideos
      resources :usefultexts
      root 'welcome#index'
    end
  end
end
