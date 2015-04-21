HealthMonitor::Application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :sessions, only: :create




    resources :users, only: [:create, :update, :destroy, :show] do
      collection do
        get 'confirm'
        post 'reset_password'
      end
      member do
        put 'change_password'
      end

    end


    resource :dashboard, only: :show

  end

  match '/api/*any',  to: 'api#no_route', via: :all

end
