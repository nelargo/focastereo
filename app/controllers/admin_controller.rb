class AdminController < ApplicationController

	before_filter :checkAdmin
	
  def index
  end

  def profe_new
  end

  def crear
  	@profe = Profesor.new(params[:professor])
    if @profesor.save
      flash[:notice] = "Registro Exitoso"
      flash[:color] = "valid"
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
end
