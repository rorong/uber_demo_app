Rails.application.routes.draw do
  get 'admin/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root to: 'welcome#index'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  #API Routes
  namespace :api do
    namespace :v1 do
    	resources :street_runs do
        collection do
          post :create_street_run
          post :check_street_permission
        end
      end
    	post 'users/sign_up', to: 'users#sign_up'
      post 'users/sign_in', to: 'users#sign_in'
      
    end
  end
end
