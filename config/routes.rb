Rails.application.routes.draw do
  get 'routes/view_routes' => 'routes#view_routes', as: :view_routes
  get 'routes/:group_id/view_route' => 'routes#view_route', as: :view_route

  get 'group/view_groups'
  get 'group/view_group'

  get 'run_sheets/generate_runsheet'
  get 'run_sheets/generate_runsheet_pdf'

  get 'run_sheets/generate_runsheets'
  get 'run_sheets/generate_runsheets_pdf'


  get 'payment/generate_invoice'
  get 'payment/generate_invoice_pdf'

  get 'payment/generate_invoices'
  get 'payment/generate_invoices_pdf'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
