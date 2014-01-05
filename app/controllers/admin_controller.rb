class AdminController < ApplicationController

	before_filter :checkAdmin
	
  def index
    @flag = "NADA"
  end

  def profe_new
  end

 def crear_ramo
    @ramo = Ramo.new(params[:ramos])
    if @ramo.save
      flash[:notice] = "Registro Exitoso"
      flash[:color] = "valid"
    else
      flash[:notice] = "Registro fallido"
      flash[:color] = "invalid"
    end
    redirect_to :action => "index"
  end


  def crear
  	@profe = Profesor.new(profe_params)
    if @profe.save
      flash[:notice] = "Registro Exitoso"
      flash[:color] = "valid"
      @flag = "Profe Agregado"
    else
      flash[:notice] = "Registro fallido"
      flash[:color] = "invalid"
    end
    redirect_to :action => "index"
  end

  def verRamos
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

private
 def profe_params
    params.require(:profesor).permit(:nombre, :rol, :password, :departamento, :mail, :oficina)
  end
end

