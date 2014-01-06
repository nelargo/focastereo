class ProfeController < ApplicationController
	before_filter :esProfe


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
    @etapa = Etapa.find(1)
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

  def procesarEditarRamo
    profe = Profesor.find_by_rol(session[:id_usuario])
    ramo = Ramo.find(params[:editar_ramo][:id_ramo])
    if ramo.profesor != profe.nombre
      redirect_to root_path
      return
    end
    @solicitud_de_cambio = Editar_ramo.new(ramo_params)
    @solicitud_de_cambio.save
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
    redirect_to action: "mis_cursos"
  end

  def postulaciones
    @postulaciones = Postular.where(id_ramo: params[:id])
    #@postulaciones = Application.where(id_curso: params[:id], status_postulacion: "pendiente")
    @etapa = Etapa.find(1)
  end


  def aceptar
    postulacion = Postular.find(params[:idPostulacion])
    ramo = Ramo.find(postulacion.id_ramo)
    prof = Profesor.find_by_rol(session[:id_usuario])
    if ramo.profesor != prof.nombre
      redirect_to root_path
      return
    end
    postulacion.status = "Aceptado"
    postulacion.save
    redirect_to postulaciones_path(params[:idCurso])
  end

  def rechazar
    postulacion = Postular.find(params[:idPostulacion])
    ramo = Ramo.find(postulacion.id_ramo)
    prof = Profesor.find_by_rol(session[:id_usuario])
    if ramo.profesor != prof.nombre
      redirect_to root_path
      return
    end
    postulacion.status = "Rechazado"
    postulacion.save
    redirect_to postulaciones_path(params[:idCurso])
  end

private
  def ramo_params
    params.require(:editar_ramo).permit!
  end

end
