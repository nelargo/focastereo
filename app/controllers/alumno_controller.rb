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
  	@ramos = Ramo.where(:activo => 1)    
  end

  def postulacion_new
    @ramos = Ramo.find_by_id(params[:id])
  end

  def crear_postulacion
    @post = Postular.new(postulacion_params)
    @post.save
    redirect_to :action => "index"
  end

  def eliminar_postulacion
  end

private
  def postulacion_params
    params.require(:postulacion).permit!
  end
 
end
