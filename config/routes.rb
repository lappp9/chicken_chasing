ChickenChasing::Application.routes.draw do
  resources :payment_methods

  root 'static_pages#home'
  #root 'static_pages#landing'

  get 'home' => 'static_pages#home'
  post 'email_list' => 'static_pages#email_list'
  resources :users, :products, :farmers, :customers

  resources :users do
    resources :payment_methods
  end

  resources :farmers do
    resources :farms
    resources :orders
  end

  resources :payment_methods
  resources :orders
  
  resources :farms do
    resources :products
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/checkout' => 'cart#checkout'
  post "/cart" => "cart#add"
  get "/cart" => "cart#show"
  get "/cart_products" => "cart#index"

  delete "/cart/:product_id" => "cart#destroy"
  
  match '/product_search', to: 'products#search_results',     via: 'get'

  match '/signup_options', to: 'static_pages#signup_options', via: 'get'
  match '/signup',         to: 'users#new',                   via: 'get'

  match '/login',          to: 'sessions#new',                via: 'get'
  match '/logout',         to: 'sessions#destroy',            via: 'delete'

  get '/contact', to: 'static_pages#contact', as: :contact

  match '/about',          to: 'static_pages#about',          via: 'get'
  match '/privacy',        to: 'static_pages#privacy',        via: 'get'
  match '/terms',          to: 'static_pages#terms',          via: 'get'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
