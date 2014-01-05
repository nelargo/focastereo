class AdminController < ApplicationController

	before_filter :checkAdmin
	
  def index
    @flag = "NADA"
  end

  def profe_new
  end

 def crear_ramo
    @ramo = Ramo.new(ramo_params)
    if @ramo.save
      flash[:notice] = "Registro Exitoso"
      flash[:color] = "valid"
    else
      flash[:notice] = "Registro fallido"
      flash[:color] = "invalid"
    end
    redirect_to :action => "index"
  end

  def editarRamo
    @ramo = Ramo.find_by_id(params[:id])
    @profesores = Profesor.pluck(:nombre)
  end

  def editar
    curso = Ramo.find(params[:ramo][:id])
    curso.update_attributes(ramo_params)
    redirect_to :action => "index"
  end


  def crear
    @profe = Profesor.new(profe_params)
    if @profe.save  
      flash[:notice] = "Registro Exitoso"
      flash[:color] = "valid"
      redirect_to :action => "index"
    else
      flash[:notice] = "Registro fallido"
      flash[:color] = "invalid"
    
    redirect_to :action => "profe_new"
      end
  end

  def verRamo
    @ramos = Ramo.all
  end

  def checkAdmin
    if session[:type] != "administrator"
      redirect_to root_path
      return
    else
      return
    end
  end

  def peticiones
    @p = Editar_ramo.all
  end

  def ver_peticion
    @peticion = Editar_ramo.find_by_id(params[:id])
    @ramo = Ramo.find_by_id(@peticion.id_ramo)
  end

  def aceptar_peticion
  end

  def rechazar_peticion
  end

private
  def profe_params
    params.require(:profesor).permit(:nombre, :rol, :password, :departamento, :mail, :oficina)
  end

  def ramo_params
    params.require(:ramo).permit!
  end
end

