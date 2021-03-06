Biocharquebec::Application.routes.draw do
  resources :events do
    scope :module => "events" do
      resources :event_sessions, :path => "sessions", :as => "sessions"
    end
  end

  resources :videos

  match "/files/uploads/*path" => "gridfs#serve"
  resources :reference_files

  # resources :invitations, :module => "authentication"
  
  # devise_for :admins
  devise_for :admins, :module => "authentication"
  # devise_for :admins, :controllers => { :passwords => "authentication/passwords", :sessions => "authentication/sessions" }  

  resources :search_contents

  devise_for :users, :controllers => { :confirmations => "authentication/confirmations", :passwords => "authentication/passwords", :registrations => "authentication/registrations", :sessions => "authentication/sessions", :unlock => "authentication/unlock" }

  resources :blog_posts, :except => [:edit, :update, :destroy] do
    scope :module => "blogs" do
      resources :comments
    end
  end

  resources :overviews  
  
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
  root :to => 'overviews#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
