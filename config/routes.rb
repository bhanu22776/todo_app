Rails.application.routes.draw do

  devise_for :users

  unauthenticated :user do
    root 'home#index', as: :root
  end

  authenticated :user, ->(u) { u.has_role?(:admin) } do
    root to: "admin/home#dashboard", as: :manager_root
    namespace :admin do
      get 'home/dashboard'
      get 'home/index'
      post 'create_project', to: 'home#create_project'
      get 'home/todo_lists/:project_id', to: 'home#todo_lists', as: 'todo_lists'
      post 'add_project_todo/:project_id', to: 'home#add_todo', as: 'add_project_todo'
      post 'create_project_todo/:project_id', to: 'home#create_todo', as: 'project_todo'
      post 'assign_developer/:project_id/:to_do_list_id', to: 'home#assign_developer', as: 'assign_todo_developer'
      post 'add_developer/:project_id/:to_do_list_id', to: 'home#add_developer', as: 'add_todo_developer'
    end

  end

  authenticated :user, ->(u) { u.has_role?(:developer) } do
    root 'home#index', as: :developer_root
    get 'home/index'
    post 'change_todo_status/:project_id/:to_do_list_id', to: 'home#change_todo_status', as: 'change_todo_status'
    post 'update_todo_status/:project_id/:to_do_list_id', to: 'home#update_todo_status', as: 'update_todo_status'
  end


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
