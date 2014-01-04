class AuthController < ApplicationController
  def login
	@al = Db_alumno.all
  end

  def intento_login
  	authorized_user = Administrador.authenticate(params[:user],params[:pass])
	    if authorized_user
	    	session[:id_usuario] = authorized_user.id
	    	session[:user_name] = authorized_user.usuario
	    	session[:type] = "administrator"
	     	flash[:notice] = "Bienvenido, Usted esta loggeado como #{authorized_user.usuario}"
	      	redirect_to(:controller => 'administracion', :action => 'verCursos')
	      	return
	      	
	    else
	    	authorized_user = Db_alumno.authenticate(params[:user],params[:pass])
	    	if authorized_user
	    		session[:id_usuario] = authorized_user.rol
		    	session[:type] = "alumno"
		     	flash[:notice] = "Bienvenido, Usted esta loggeado como #{authorized_user.rol}"
		      	redirect_to(:controller => 'alumno', :action => 'index')
		      	return
	    	else
	    		authorized_user = Profesor.authenticate(params[:user],params[:pass])
		    	if authorized_user
		    		session[:id_usuario] = authorized_user.rol
			    	session[:type] = "profesor"
			     	flash[:notice] = "Bienvenido, Usted esta loggeado como #{authorized_user.rol}"
			      	redirect_to(:controller => 'profesor', :action => 'index')
			      	return
			      end
	    	end

	      	flash[:notice] = "Usuario o contrasena Invalida"
	      	flash[:color]= "invalid"
	     	redirect_to :action => "index"
	     	return

	    end
  end
end
