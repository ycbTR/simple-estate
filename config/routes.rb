Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, :defaults => {:format => 'json'} do
    namespace :v1 do
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => :login
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
        post 'registrations' => 'registrations#create', :as => 'register'
        put 'registrations' => 'registrations#update', :as => 'update'
      end

      get 'users/:id', to: 'users#show', as: :show_user
      get 'users/:id/properties', to: 'users#properties', as: :user_properties

      resources :properties, only: [:index, :show] do
      member do
        put :wish
        put :unwish
      end
    end

  end
  end

  resources :properties, only: [:index, :show] do
    member do
      put :wish
      put :unwish
    end
  end

  devise_for :users, :controllers => {:registrations => "users/registrations"}


  namespace :backend do
    resources :properties
    resources :reports
    resources :wish_lists, only: :index

  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'properties#index'

  get 'users/:id', to: 'users#show', as: :show_user

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
