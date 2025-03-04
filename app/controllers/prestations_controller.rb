class PrestationsController < ApplicationController
  def show

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
  end

  def update
  end

  def destroy
  end

  private
  def prestation_params
    params.require(:prestation).permit(:titre,:content,:lang,:intro,:title,:meta_description,:indexed,:follow,:canonical)
  end
end
