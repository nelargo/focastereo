class AdminController < ApplicationController
	before_filter :checkAdmin  

  def index
  end

<<<<<<< HEAD
  def checkAdmin
    if session[:type] != "administrator"
      redirect_to root_path
      return
    else
      return
    end
=======
  def verCursos
    @ramos = Ramos.all
>>>>>>> 56636697430cd2baff55ea5aed08a4561e285266
  end
end
