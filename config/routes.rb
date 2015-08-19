SimpleKpi::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
    resources :kpis
    resources :businesskpis  

#    resources :registerreports
   
    resources :bkdetails do 
      collection do 
        get 'dataEntry'
        get 'dataFeed'
      end
    end 

    get 'businesses/home'
    resources :franchisemasters   

    resources :businesses do
      collection do
        post 'savelinkkpi'
        get 'businesslinkkpi'        
      end
    end

  match '/get_target_percentage' => 'bkdetails#get_target_percentage'



  namespace :api do 
    namespace :v1 do
     post 'kpis/create' => 'kpis#create'
     post 'bkdetails/create' => 'bkdetails#create'
    end

  end


  #api
                         
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
#   root :to => 'businesses#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
