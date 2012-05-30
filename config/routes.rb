Bsheep::Application.routes.draw do

  match '/access_denied' => 'error#access_denied', :as => :access_denied
  match '/not_found' => 'error#not_found', :as => :not_found

  match '/language/:lang_cut' => 'welcomes#set_lang'

  scope '/:locale', :locale => /en|ru/ do

    match '/blog' => 'posts#index'
    match '/blog/:short_url' => 'posts#show', :as => :post_short
    resources :posts

    resources :services

    match '/:short_url' => 'top_levels#show', :as => :top_level_short
    resources :top_levels

    match '/work/page/:page' => 'works#page', :as => :work_page
    match '/work/:short_url' => 'works#show', :as => :work_short
    resources :works
    resources :welcomes

    devise_for :users

    #match '/auth/sign_in' => 'authentications#login', :as => :sign_in
    #match '/auth/sign_up' => 'authentications#registration', :as => :sign_up
    #devise_for :units, :controllers => {:omniauth_callbacks => "omniauth_callbacks", :registrations => 'registrations'}

  end

  resources :seo_data

  root :to => 'welcomes#index'

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
