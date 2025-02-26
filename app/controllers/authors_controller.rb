class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.friendly.find(params[:id])
    @biography = @author["biography_#{params[:locale]}".to_sym]
    add_breadcrumb "<span>#{@author.firstname} #{@author.lastname}</span>".html_safe
  end

  def new
  end

  def create

  end

  def edit
    @author = Author.friendly.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def author_params
    params.require(:article).permit(:lastname, :firstname,:function,:biography_fr,:biography_en,:biography_es,:biography_de,:slug,:email,:linkedin,:x,:facebook,:mastodon,:bluesky)
  end
end
