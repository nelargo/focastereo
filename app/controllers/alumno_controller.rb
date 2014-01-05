class AlumnoController < ApplicationController
  before_filter :checkAlumno

  def index
  	@user = session[:username]
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
  	@ramos = Ramo.find_by_activo(1)
  end

  def crear  	
  end

  def eliminar
  end
 
end
