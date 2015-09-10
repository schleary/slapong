Rails.application.routes.draw do

  get     '/',                      to: 'home#index',         as: :root

  # blog routes
  get     '/blog',                  to: 'blog#index',         as: :post
  get     '/blog',                  to: 'blog#index',         as: :posts
  get     '/blog/new',              to: 'blog#new',           as: :posts_new
  post    '/blog',                  to: 'blog#create',        as: :posts_create
  get     '/blog/:id',              to: 'blog#show',          as: :posts_show
  get     '/blog/:id/edit',         to: 'blog#edit',          as: :posts_edit
  patch   '/blog/:id',              to: 'blog#update',        as: :posts_update
  get     '/blog/:id/delete',       to: 'blog#destroy',       as: :posts_delete
  delete  '/blog/:id',              to: 'blog#destroy',       as: :posts_destroy

  get     '/shop',                  to: 'shop#index',         as: :shop

  get     '/play',                  to: 'play#index',         as: :play

  get     '/events',                to: 'events#index',       as: :event
  get     '/events',                to: 'events#index',       as: :events
  get     '/events/new',            to: 'events#new',         as: :events_new
  post    '/events',                to: 'events#create',      as: :events_create
  get     '/events/:id',            to: 'events#show',        as: :events_show
  get     '/events/:id/edit',       to: 'events#edit',        as: :events_edit
  patch   '/events/:id',            to: 'events#update',      as: :events_update
  get     '/events/:id/delete',     to: 'events#destroy',     as: :events_delete
  delete  '/events/:id',            to: 'events#destroy',     as: :events_destroy

  get     '/contact',               to: 'contact#index',      as: :contact


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
