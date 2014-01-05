class ProfeController < ApplicationController
	before_filter :esProfe

private
  def esProfe
    if session[:type] != "profesor"
      redirect_to root_path
      return
    else
      return
    end
  end

  def index
  	@profesor = Profesor.find_by_rol(session[:id_usuario])
  end

  def mis_cursos
  	@profesor = Profesor.find_by_rol(session[:id_usuario])
  	@ramos = Ramo.all
  end
  def editarRamo
    @profesor = Profesor.find_by_rol(session[:id_usuario])
    @ramo = Ramo.find(params[:id])
    if @ramo.profesor != @profesor.nombre
      redirect_to root_path
      return
    end
  end  
  def procesarEditarAsignatura
    profe = Profesor.find_by_rol(session[:id_usuario])
    ramo = Ramo.find(params[:editar_ramos][:id_curso])
    if ramo.profesor != profesor.nombre
      redirect_to root_path
      return
    end
    solicitud_de_cambio = Editar_ramos.new(params[:editar_ramos])
    solicitud_de_cambio.save
    #@mail = 
    #require 'mail'
    #sujeto = params[:mailSubject]
    #cuerpo = params[:mailBody]
    #administradores = Administrator.all
    #administradores.each do |administrador|
    #  Mail.deliver do
    #    to administrador.mail
    #    from 'OutBlackSupport@outblack.com'
    #    subject sujeto
    #    body cuerpo
    #  end
    #end
    redirect_to action: "asignaturas"
  end
  def verPostulantes
    @postulaciones = Application.where(id_curso: params[:id])
    #@postulaciones = Application.where(id_curso: params[:id], status_postulacion: "pendiente")
    @etapa = Stage.find(1)
  end
  def aceptar
    postulacion = Application.find(params[:idPostulacion])
    curso = Course.find(postulacion.id_curso)
    profesor = Professor.find_by_rol(session[:id_usuario])
    if curso.profesor != profesor.nombre
      redirect_to root_path
      return
    end
    postulacion.status_postulacion = "aceptada"
    postulacion.save
    redirect_to ver_postulantes_path(params[:idCurso])
  end
  def rechazar
    postulacion = Application.find(params[:idPostulacion])
    curso = Course.find(postulacion.id_curso)
    profesor = Professor.find_by_rol(session[:id_usuario])
    if curso.profesor != profesor.nombre
      redirect_to root_path
      return
    end
    postulacion.status_postulacion = "rechazada"
    postulacion.save
    redirect_to ver_postulantes_path(params[:idCurso])
  end

end
