TSC2013::Application.routes.draw do

  get "/logout" => "application#logout", :as => "logout"  
#ALUMNO

  get "alumno/index"
  get "alumno/postular" => "alumno#postular"
  

#PROFESORES  
  get "profe/index"
  get "profe/mis_cursos/" => "profe#mis_cursos"
  get "profe/editarRamo/:id" => "prof#editarRamo", :as => 'editar_ramo'
  post "profe/editarRamo/id" => "prof#procesarEditarRamo"
  get "profe/postulaciones/:id" => "profe#postulaciones", :as => 'postulaciones'
  get "profe/rechazar/:idPostulacion/:idCurso" => "profe#rechazar", :as => 'rechazar'
  get "profe/aceptar/:idPostulacion/:idCurso" => "profe#aceptar", :as => 'aceptar'

#ADMINISTRACION  
  get "admin/index"
  get "admin/ramo_new"
  get "admin/verRamo"
  get "admin/profe_new" => "admin#profe_new"
  post "admin/profe_new" => "admin#crear"
  get "admin/ramo_new" => "admin#ramo_new"
  post "admin/ramo_new" => "admin#crear_ramo"

#AUTHENTIFICATION
  get "auth/login"
  root :to  => "auth#login"
  post "auth/intento_loginurl" => "auth#intento_login"


  
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
