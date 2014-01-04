class AuthController < ApplicationController
  def login
  end

  def intento_login
  	authorized_user = Administrator.authenticate(params[:username_or_email],params[:login_password])
	    if authorized_user
	    	session[:user_id] = authorized_user.id
	    	session[:user_name] = authorized_user.usuario
	    	session[:type] = "administrator"
	     	flash[:notice] = "Bienvenido, Usted esta loggeado como #{authorized_user.usuario}"
	      	redirect_to(:controller => 'administracion', :action => 'verCursos')
	      	return
	      	
	    else
	    	authorized_user = Dbalumno.authenticate(params[:username_or_email],params[:login_password])
	    	if authorized_user
	    		session[:user_id] = authorized_user.rol
		    	session[:type] = "alumno"
		     	flash[:notice] = "Bienvenido, Usted esta loggeado como #{authorized_user.rol}"
		      	redirect_to(:controller => 'alumno', :action => 'index')
		      	return
	    	else
	    		authorized_user = Professor.authenticate(params[:username_or_email],params[:login_password])
		    	if authorized_user
		    		session[:user_id] = authorized_user.rol
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
