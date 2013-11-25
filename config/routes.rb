Wisdomsun::Application.routes.draw do

  # This line mounts Forem's routes at /bulletin.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/bulletin'

  mount RedactorRails::Engine => '/redactor_rails'

  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :sessions => 'users/sessions' }

  get "welcome/index"
#  resources :about, :only => [:index, :show]
  resources :books, :only => [:index, :show]
  resources :bulletin
  resources :contact
  resources :support, :only => [:index, :create]
  resources :downloads, :only => [:index, :show]
  resources :events, :only => [:index, :show]
  resources :photos, :only => [:index, :show]
  resources :albums, :only => [:index, :show]
  resources :quotes, :only => [:index]
  resources :categories, :only => [:index, :show]
  resources :otherPages, :only => [:index, :show]
  match 'categories/:category_name/:page_name', :to => 'categories#getpage', :format => false
  match 'around_the_web', :to => 'around_the_web_posts#index'  
  resources :books do
    get 'fake_url', :action => "index" , :controller => "books"
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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
