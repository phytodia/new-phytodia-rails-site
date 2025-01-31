class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @authors = Author.all
  end

  def create
    #require 'json'
    @article = Article.new(article_params)
    @authors = params[:article][:author][:author_ids].reject { |c| c.empty? }
    @authors = Author.where(id:@authors)
    @article.save
    fail
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:titre,:content)
  end
end
