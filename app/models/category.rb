class Category < ApplicationRecord
  has_many :category_articles
  has_many :articles, through: :category_articles

  after_create :downcase_titre

  def articles_size(lang)
    self.articles.where(lang: lang).size
  end
  def downcase_titre
    self.update(titre: self.titre.downcase)
  end
end
