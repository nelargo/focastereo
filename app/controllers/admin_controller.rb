class AdminController < ApplicationController
  def index
  end

  def verCursos
    @ramos = Ramos.all
  end
end
