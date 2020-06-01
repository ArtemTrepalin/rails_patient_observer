Rails.application.routes.draw do

 namespace :api do
  namespace :v1 do
  end
 end

 scope module: :web do
    namespace :admin do
      resource :session, only: [:new, :create, :destroy]
        root 'welcome#index'
        resources :admins do
          put 'restore'
          put 'del'
        end
    end
  end
end
