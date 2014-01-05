class AlumnoController < ApplicationController
  befor_filter :checkAlumno

  def index
  	@user = session[:username]
  	@etapa = Etapa.all
  end

  def checkAlumno
  	if session[:type] != "alumno"
  		redirect_to root_path
  		return
  	else
  		return
  end

  def postulacion
  	@ramos = Ramo.find_by_activo(1)
  end



  
end
