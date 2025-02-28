class Category < ApplicationRecord
has_many :category_articles
has_many :articles, through: :category_articles

  def articles_size(lang)
    self.articles.where(lang: lang).size
  end
end
