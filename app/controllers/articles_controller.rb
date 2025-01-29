class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
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
