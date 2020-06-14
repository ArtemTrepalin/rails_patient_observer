Rails.application.routes.draw do

  root to: 'web/admin/welcome#index'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :statuses, only: :show
      resources :watchers do
        scope module: :watchers do
          resources :patients do
            scope module: :patients do
              resources :checklists
              resources :contacts
              resources :help_addresses
              resources :diets
              resources :histories
            end
          end
        end
      end
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
