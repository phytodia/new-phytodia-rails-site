class ArticlesController < ApplicationController
  before_action :set_categories
  def index
    @articles = Article.where(lang:params[:locale])
    @article = Article.last
    @headline = Article.where(headline:true).first

    add_breadcrumb "Blog", :blog_path
  end

  def show
    @article = Article.friendly.find(params[:id])

    headings = JSON.parse(@article.content.body)["content"].select{|arr| arr["type"] === "heading"}
    headings_2 = headings.select{|arr| arr["attrs"]["level"] === 2}

    @summary = []

    headings_2.each_with_index do |head, index|
      head["attrs"].merge!(id:index) if !head["content"].nil?
      @summary << {head: head["content"][0]["text"], index: index} if !head["content"].nil?
    end

    add_breadcrumb "Blog", :blog_path
    add_breadcrumb "<span>#{@article.titre}</span>".html_safe
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

    #xx = ((JSON.parse(@article.content.body)["content"].select{|arr| arr["type"] === "heading"}).select{|arr| arr["attrs"]["level"] === 2}).each_with_index do |head, index|
      #head["attrs"].merge!(id:index) if !head["content"].nil?
    #end

    #counter_ids = 0
    #yy = JSON.parse(@article.content.body)
    #yy["content"].each do |arr|
    #  if arr["type"] === "heading" && arr["attrs"]["level"] === 2
    #    arr["attrs"].merge!("id": counter_ids)
    #    counter_ids += 1
    #  end
    #end

    #@article.content.body = yy.to_json
    #zz = JSON.parse(@article.content.body)
    #@article.content.body = yy.to_json

    categories = params[:article][:category_ids].reject { |c| c.empty? }
    @categories = Category.where(id:categories)
    @article.categories = @categories

    @article.save!

    redirect_to blog_path
  end

  def destroy
  end

  def category
    fail
  end
  def category_filter
    category = params[:cat].downcase
    if !category.blank?
      @articles = Category.find_by(titre:params[:cat].downcase).articles.where(lang:params[:locale])

      articles_filtered = []
      @articles.each do |article|
        articles_filtered << article if article.categories.first.titre == params[:cat].downcase
      end

      @articles = Article.where(id: articles_filtered.map(&:id))
    else
      @articles = Article.where(lang: params[:locale])
    end

    @headline = Article.where(headline:true).first

    respond_to do |format|
      format.turbo_stream { render 'category_filter', locals: { articles: @articles,category: category,headline:@headline }}
      format.html { redirect_to blog_category_path(category)}
    end
  end
  private
  def article_params
    params.require(:article).permit(:titre,:content,:slug_authors,:slug,:lang,:title,:meta_description,:indexed,:follow,:intro,:read_time,:cover,:legend_cover,:headline,:summary,categories:[])
  end

  def set_categories
    @categories = []
    Category.all.each do |cat|
      @categories.push(cat) if cat.articles_size(params[:locale]) > 0
    end
  end
end
