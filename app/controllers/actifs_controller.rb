class ActifsController < ApplicationController
  layout "backoffice",only:[:new,:create,:edit,:update,:destroy]
  def index
    lang = locale.to_s
    @actifs = Actif.where(lang: lang)
  end

  def new
    @actif = Actif.new
  end

  def create
    @actif = Actif.new(actif_params)
    @actif.save
  end

  def show
    @actif = Actif.find(params[:id])
  end

  def edit
    @actif = Actif.find(params[:id])
  end

  def update
    @actif = Actif.find(params[:id])
    @actif.update(actif_params)
    redirect_to actifs_path
  end

  def destroy
  end

  private
  def actif_params
    params.require(:actif).permit(:lang,:name,:description,:composition,:proprietes,:types_produits,:cible,:efficacite,:donnees,:concentration,photos: [])
  end

end
