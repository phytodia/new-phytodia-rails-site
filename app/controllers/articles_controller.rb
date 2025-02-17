class ArticlesController < ApplicationController
  def index
    @articles = Article.where(lang:params[:locale])
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  def new
    @article = Article.new
    @authors = Author.all
  end

  def create
    #require 'json'
    @article = Article.new(article_params)
    @authors = params[:article][:author_ids].reject { |c| c.empty? }
    @authors = Author.where(id:@authors)
    @article.authors = @authors
    @article.save

    redirect_to blog_path
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:id])
    @article.update(article_params)
    authors = params[:article][:author_ids].reject { |c| c.empty? }
    @authors = Author.where(id:authors)
    @article.authors = @authors
    @article.save

    redirect_to blog_path
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:titre,:content,:slug_authors,:slug,:lang)
  end
end
