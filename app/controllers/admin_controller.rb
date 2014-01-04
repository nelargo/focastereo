class AdminController < ApplicationController
	before_filter :checkAdmin  

  def index
  end

<<<<<<< HEAD
  def verRamos
    @ramos = Ramo.all
=======
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
>>>>>>> edc9bdfc86e053a9fb6d883c799634632cb68e35
  end
end
