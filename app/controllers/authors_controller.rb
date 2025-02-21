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
  end

  def update
  end

  def destroy
  end
end
