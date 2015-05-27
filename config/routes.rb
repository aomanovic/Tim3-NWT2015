HealthMonitor::Application.routes.draw do
  root 'home#index'

  get 'admin', :controller => 'home_controller', :action => :admin, as: 'admin'

  namespace :api do
    resources :sessions, only: :create


    resources :users, only: [:create, :update, :destroy, :show,:index,:donut_data, :pie_data] do
      collection do
        post :check_email
        get :donut_data
        get :pie_data
        post :is_admin
        post :check_username
        get  :change_password_form
        put  :change_password
        get  :confirm
        post :reset_password
      end

      resources :uploads

    end

    resources :symptoms do
    end
    resources :diagnoses do
    end

    resources :uploads, only: [:index, :show, :create]

    resources :messages, only: [:index, :show, :create]
    resource :dashboard, only: :show
  end

  match '/api/*any',  to: 'api#no_route', via: :all
end
