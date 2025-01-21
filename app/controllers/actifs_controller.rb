class ActifsController < ApplicationController
  layout "backoffice",only:[:new,:create,:edit,:update,:destroy]

  def index
    add_breadcrumb t("breadcrumbs.actifs") , :actifs_path
    lang = locale.to_s
    @actifs = Actif.where(lang: lang)
  end

  def new
    @actif = Actif.new
    @ingredients =  YAML.load_file("#{Rails.root.to_s}/db/ingredients.yml")["ingredients"]
  end

  def create
    @actif = Actif.new(actif_params)
    @actif.save
  end

  def show
    @actif = Actif.find(params[:id])
    @cats_produits = @actif.cat_produits.reject { |c| c.empty? }
    @props_actif = @actif.props_tags.reject { |c| c.empty? }
    @actifs = Actif.where(lang:params[:locale])
    add_breadcrumb t("breadcrumbs.actifs") , :actifs_path
    add_breadcrumb "<span>#{@actif.name}</span>".html_safe, :actif_path
  end

  def edit
    @actif = Actif.find(params[:id])
    @ingredients =  YAML.load_file("#{Rails.root.to_s}/db/ingredients.yml")["ingredients"]
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
    params.require(:actif).permit(:lang,:name,:description,:proprietes,:types_produits,:cible,:efficacite,:donnees,:concentration,:document,photos: [],cat_produits:[],props_tags:[],composition:[])
  end

end
