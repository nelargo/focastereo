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
  	@profesor = Profesor.find_by_rol(session[:user_id])
  end

  def mis_cursos
  	@profesor = Profesor.find_by_rol(session[:user_id])
  	@ramos = Ramo.all
  end
end
