Rails.application.routes.draw do
  
   get 'contents/searchindex', :as=> :contents_searchindex
   get 'content2s/searchindex', :as=> :content2s_searchindex
   get 'content3s/searchindex', :as=> :content3s_searchindex
  
  resources 'content3s' do
    resources 'comment3s'
  end
  get 'contents/rate2s/:id', to:'contents#rate2', :as=> :rate2
  get 'contents/home', :as=> :home
  resources 'content2s' do
    resources 'comment2s'
  end
  get 'users/new'
  get 'users/cow', :as=> :cow_user
  get 'users/update', :as=> :update_user
  resources :users, only: [:new, :create, :edit, :udpate]
  resources :sessions, only: [:new, :create, :destroy]

  resources 'contents' do
    resources 'comments'
  end
  
  resources 'contents' do
    resources 'rate2s'
  end
  
   resources :users do
    member do
      get :confirm_email
    end
  end
  
  root 'contents#home'


  resources :users do
    member do
      get :confirm_email
    end
  end
  #이메일인증


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
