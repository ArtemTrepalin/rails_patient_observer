Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
    end
  end

  scope module: :web do
    namespace :admin do
      resource :session, only: [:new, :create, :destroy]
      resources :admins
      resources :statuses
      resources :watchers
      root 'welcome#index'
    end
  end
end
