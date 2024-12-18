class AdminsController < ApplicationController
  layout "backoffice"
  def home

  end
  def index
  end

  def actifs
    @actifs = Actif.all
  end
end
