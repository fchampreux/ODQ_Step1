ODQStairs::Application.routes.draw do

  resources :requests

#static pages
  get '/help', 		to: "static_pages#help"
  get '/about', 	to: "static_pages#about"
  get '/contact', 	to: "static_pages#contact"
  get '/monitoring',    to: "static_pages#monitoring"

#root definition
  root to: "dashboards#home"

#routes
  resources :sessions, only: [:new, :create, :destroy]  
  get '/signin',  to: 'sessions#new'	, via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :parameters_lists do
      resources :parameters
  end

  resources :parameters

  resources :values_lists do
      resources :values
      resources :mappings_lists
  end

  resources :values

  resources :mappings_lists do
      resources :mappings
  end

  resources :mappings

  resources :business_areas do
      resources :business_flows, :only=>[:new, :create]
      resources :business_objects, :only=>[:new, :create]
  end

  resources :business_flows do
      resources :business_processes, :only=>[:new, :create]
  end

  resources :business_processes do
      resources :business_rules, :only=>[:new, :create]
  end

  resources :business_objects do
    get 'push', on: :member
    resources :columns
  end

  resources :business_rules do
      resources :breaches
  end

  resources :notifications do
      resources :breaches
  end
  
  resources :breaches

  resources :users

  resources :user_accesses

  resources :roles

  resources :territories do
       resources :territories, :only=>[:new, :create]
  end

  resources :organisations do
       resources :organisations, :only=>[:new, :create]
  end

  resources :records do
       resources :update_requests, :only=>[:new, :create]
  end


  resources :time_scales

  resources :data_policies

  resources :scopes do
    resources :business_rules, :only=>[:new, :create]
  end

  resources :landscapes do
    resources :scopes, :only=>[:new, :create]
  end

  resources :playgrounds do
    resources :landscapes, :only=>[:new, :create]
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
