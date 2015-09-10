Rails.application.routes.draw do

  get     '/',                      to: 'home#index',         as: :root

  # blog routes
  get     '/blog',                  to: 'blogs#index',        as: :blogs
  get     '/blog/new',              to: 'blogs#new',          as: :blogs_new
  post    '/blog',                  to: 'blogs#create',       as: :blogs_create
  get     '/blog/:id',              to: 'blogs#show',         as: :blogs_show
  get     '/blog/:id/edit',         to: 'blogs#edit',         as: :blogs_edit
  patch   '/blog/:id',              to: 'blogs#update',       as: :blogs_update
  get     '/blog/:id/delete',       to: 'blogs#destroy',      as: :blogs_delete
  delete  '/blog/:id',              to: 'blogs#destroy',      as: :blogs_destroy

  get 'shop/index',                 to: 'shop#index',         as: :shop

  get 'play/index',                 to: 'play#index',         as: :play

  get 'events/index',               to: 'events#index',       as: :events

  get 'contact/index',              to: 'contact#index',      as: :contact


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