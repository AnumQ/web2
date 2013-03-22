Lc::Application.routes.draw do
  
  devise_for :users

  devise_scope :user do
    match '/login', :to => "devise/sessions#new", :as => 'login'
    match '/logout', :to => "devise/sessions#destroy", :as => 'logout'
    match '/signup', :to => "devise/registrations#new", :as => 'signup'
  end  

  resources :user, :controller => "user"
  get 'user/edit'
  match "/products/search", :to => "products#search", :as => 'product_search'
  match "/store/search", :to => "store#search", :as => 'store_search'
  match "/orders/:id/approve", :to => "orders#approve", :as => 'approve'
  match "/line_items/:id/remove_item", :to => "line_items#remove_item", :as => 'remove_line_items'
  match "/line_items/:id/insert_item", :to => "line_items#insert_item", :as => 'insert_items'
  match "/users/", :to => "user#index", :as => "users"
  match "/owa/", :to => "orders#orders_waiting_approval", :as => "owa"
  match "/display_cart", :to => "carts#display_cart", :as => "display_cart"	
  get '/admin'=> 'admin#index'

  resources :orders
  resources :line_items
  resources :carts

  get "store/index"
  root :to => 'store#index', :as => 'root'
  match '/store', :to => 'store#index', :as => 'store'

  resources :products

  match '/products', :to => 'product#index', :as => 'products'
  resources :products do
	get :who_bought, :on => :member
  end

  get "pages/home"
  get "pages/about"
  get "pages/contact"
  get "pages/help"
  
  match '/home', :to => 'pages#home', :as => 'home'
  match '/help', :to => 'pages#help', :as => 'help'
  match '/about', :to => 'pages#about', :as => 'about'
  match '/contact', :to => 'pages#contact', :as => 'contact' 
  
  match '/products', :to => 'products#index', :as => 'products'

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
