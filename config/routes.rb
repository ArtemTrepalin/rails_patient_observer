Rails.application.routes.draw do

  root to: 'web/admin/welcome#index'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :watchers
    end
  end

  scope module: :web do
    namespace :admin do
      resource :session, only: [:new, :create, :destroy]
      resources :admins
      resources :statuses
      resources :watchers
      resources :sicknesses
      resources :patients
      resources :checklists
      resources :contacts
      resources :histories, only: [:index, :show]
      root 'welcome#index'
    end
  end
end
