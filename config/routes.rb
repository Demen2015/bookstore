Rails.application.routes.draw do

  get    'signup'   => 'users#new'
  get    'login'   => 'users#login'
  post   'login'   => 'users#create'
  get    'logout'  => 'users#destroy'
  get    'register' => 'users#new'
  post   'register' => 'users#add'


  get 'cart/' => 'shoppingcarts#index'
  get 'cart/clear' => 'shoppingcarts#clearItem'
  get 'cart/delete' => 'shoppingcarts#delete'
  # get 'cart/update' => 'cart#update'
  get 'cart/:id' => 'shoppingcarts#add'
  get '/confirm' => 'shoppingcarts#confirm'
  get '/complete' => 'shoppingcarts#complete'

  get 'categories/show'

  get 'categories/add'

  get 'categories/update'

  get 'categories/destroy'

  get 'products' => 'products#index'

  get 'products/show' => 'products#show'
  get 'products/:id(/:format)'  => 'products#show'

  get 'products/add'

  get 'products/update' => 'products#update'

  get 'products/destroy'

  root 'page#home'

  get 'page/home' => 'index'

  get 'page/shop'

  get 'page/contact'

  get 'page/faqs'

  get 'page/store' => 'page#store'
  get '/search' => 'page#search'

  get 'user/login'

  get 'user/logout'

  get 'user/register'



  get 'category/:id' => 'categories#show'
  resources :categories do
    resources :products
  end

  resources :products do
    resources :comments
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
