Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'
  
  get 'routes/view_routes' => 'routes#view_routes', as: :view_routes
  get 'routes/view_routes/:id/' => 'routes#view_routes_for_group', as: :view_routes_for_group
  get 'routes/:id/' => 'routes#view_route', as: :view_route
  post 'routes/run' => 'routes#get_run_info', as: :view_route_run_info
  post 'routes/update_route' => 'routes#update_route', as: :update_route

  get 'group/view_groups' => 'group#view_groups', as: :view_groups
  get 'group/view_group'

  get 'group/:id/report' => 'group#report', as: :report
  get 'group/:id/report/pdf' => 'group#report_pdf', as: :report_pdf

  get 'run_sheets/generate_runsheet/' => 'run_sheets#generate_runsheet_for_user', as: :generate_runsheet_for_user
  get 'run_sheets/generate_runsheet_pdf' => 'run_sheets#generate_runsheet_pdf', as: :generate_runsheet_pdf

  get 'run_sheets/generate_runsheets/:id/' => 'run_sheets#generate_runsheets_for_group', as: :generate_runsheets_for_group
  get 'run_sheets/generate_runsheets_pdf/:id/' => 'run_sheets#generate_runsheets_pdf', as: :generate_runsheets_pdf

  get 'subscription/:group_id/invoices' => 'subscription#index', as: :view_invoices
  get 'subscription/:group_id/generate_invoices' => 'subscription#generate_invoices', as: :generate_invoices
  get 'subscription/:group_id/generate_invoices_pdf' => 'subscription#generate_invoices_pdf', as: :generate_invoices_pdf

  post 'subscription/add_maintenance_note' => 'subscription#add_maintenance_note', as: :add_maintenance_note

  post 'runs/begin' => "runs#begin_run", as: :begin_run
  post 'runs/end' => "runs#end_run", as: :end_run
  post 'runs/progress' => "runs#get_run_progress", as: :run_progress

  post 'task/set' => "tasks#set_task", as: :set_task


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


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
