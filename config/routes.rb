Untitled::Application.routes.draw do
  #get "question1s/new"=>"question1s#new"
  get "controller/demo2"
  get "demo2/index"=> "demo2#index"
  get "upload/index"=>"upload#index"
  get "demo2/testdrag"=>"demo2#testdrag"
  post "upload/upload"=>"upload#upload"
  get "demo3/index"=>"demo3#index"
  get "demo3/index1"=>"demo3#index1"
  get "demo3/freda"=>"demo3#freda"
  get "demo3/listdata"=>"demo3#listdata"
  get "demo3/adddata"=>"demo3#adddata"
  post "demo3/addquestion"=>"demo3#addQuestion"
  post "demo3/addquestion1"=>"demo3#addquestion1"
  post  "demo3/updatequestion1(/:id)"=>"demo3#updatequestion1"
  get  "demo3/showquestion1(/:id)"=>"demo3#showquestion1"
  get "demo3/newquestion1"=>"demo3#newquestion1"
  post "demo3/addquestion1"=>"demo3#addquestion1"

  get "demo3/newanswer1"=>"demo3#newanswer1"
  post "demo3/newanswer1"=>"demo3#newanswer1"
  get "demo3/showanswer1/(:id)"=>"demo3#showanswer1"
  post "demo3/updateanswer1"=>"demo3#updateanswer1"
  get "demo3/editanswer1/(:id)"=>"demo3#editanswer1"
  match ':controller(/:action(/:id))(.:format)'


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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

end
