class AdminController < ApplicationController

  def index
  end

  def verRamos
    @ramos = Ramo.all
  end
end
