class FaqsController < ApplicationController
  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    @faq.categories = @faq.categories.reject { |c| c.empty? }
    @faq.save
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def faq_params
    params.require(:faq).permit(:question,:answer,:lang,categories:[])
  end
end
