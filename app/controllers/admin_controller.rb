class AdminController < ApplicationController
	before_filter :checkAdmin  

  def index
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
