class PrestationsController < ApplicationController
  def show
    @prestation = Prestation.find(params[:id])
    add_breadcrumb "<span>#{@prestation.titre}</span>".html_safe
  end

  def new
    @prestation = Prestation.new
  end

  def create
    @prestation = Prestation.new(prestation_params)
    @prestation.save

    redirect_to admins_path()
  end

  def edit
    @prestation = Prestation.find(params[:id])
  end

  def update
    @prestation = Prestation.find(params[:id])
    @prestation.update(prestation_params)
    @prestation.save
    redirect_to admins_path()
  end

  def destroy
  end

  private
  def prestation_params
    params.require(:prestation).permit(:titre,:content,:lang,:intro,:title,:meta_description,:indexed,:follow,:canonical,categories:[])
  end
end
