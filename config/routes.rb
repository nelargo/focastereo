TSC2013::Application.routes.draw do

#ALUMNO
  
  get "alumno/index"
  get "alumno/postular"             => "alumno#postular"
  get "alumno/postulacion_new"
  get "alumno/postulacion_new/:id"  => "alumno#postulacion_new", :as => 'nueva_postulacion'
  post "alumno/postulacion_new"     => "alumno#crear_postulacion"
  get "alumno/index/:id"      => "alumno#eliminar_postulacion", :as => 'eliminar_postulacion'   

#PROFESORES  
  get "profe/index"
  get "profe/mis_cursos/"                       => "profe#mis_cursos"
  get "profe/editarRamo/:id"                    => "profe#editarRamo",        :as => 'editar_ramo'
  post "profe/editarRamo/id"                    => "profe#procesarEditarRamo"
  get "profe/postulaciones/:id"                 => "profe#postulaciones",     :as => 'postulaciones'
  get "profe/rechazar/:idPostulacion/:idCurso"  => "profe#rechazar",          :as => 'rechazar'
  get "profe/aceptar/:idPostulacion/:idCurso"   => "profe#aceptar",           :as => 'aceptar'

#ADMINISTRACION  
  get "admin/index"
  get "admin/ramo_new"
  get "admin/verRamo"               => "admin#verRamo"
  get "admin/editarRamo/:id"        => "admin#editarRamo",        :as => 'editar_ramo_admin' 
  post "admin/editarRamo"           => "admin#editar"
  get "admin/profe_new"             => "admin#profe_new"
  post "admin/profe_new"            => "admin#crear"
  get "admin/ramo_new"              => "admin#ramo_new"
  post "admin/ramo_new"             => "admin#crear_ramo"
  get "admin/peticiones"            => "admin#peticiones"
  get "admin/ver_peticion/:id"      => "admin#ver_peticion",      :as => 'ver_peticion'
  get "admin/aceptar_peticion/:id"  => "admin#aceptar_peticion",  :as => 'aceptar_peticion'
  get "admin/rechazar_peticion/:id" => "admin#rechazar_peticion", :as => 'rechazar_peticion'  
  get "admin/cambiar_etapa/:id"     => "admin#cambiar_etapa",     :as => 'cambiar_etapa'

#AUTHENTIFICATION
  get "auth/login"
  root :to                      => "auth#login"
  post "auth/intento_loginurl"  => "auth#intento_login"
  get "/logout"                 => "application#logout", :as => 'logout'

  
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
