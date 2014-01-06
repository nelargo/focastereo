class AlumnoController < ApplicationController
  before_filter :checkAlumno

  def index
  	@user = Db_alumno.find_by_rol(session[:id_usuario])
  	@etapa = Etapa.all
  	@postulaciones = Postular.find_by_id_alumno(session[:id])
  end

  def checkAlumno
  	if session[:type] != "alumno"
  		redirect_to root_path
  		return
  	else
  		return
  	end
  end

  def postular
  	@ramos = Ramo.where(:id => params[:id], :activa => 1)    
  end

  def crear  	
  end

  def eliminar
  end
 
end
