class Article < ApplicationRecord
  has_many :author_publications
  has_many :authors, through: :author_publications
  has_many :category_articles
  has_many :categories, through: :category_articles
  has_rich_text :intro
  has_richer_text :content, store_as: :json

  has_one_attached :cover

  #validates :authors, presence: true
  validates :lang, presence: true

  extend FriendlyId
  friendly_id :titre, use: :slugged

  after_validation :slug_authors, on: [ :create, :update ]

  paginates_per 8

  def slug_authors
    slug = []
    self.authors.each do |author|
      slug << "#{author.firstname.downcase }-#{author.lastname.downcase}"
    end
    self.slug_authors = slug.join("-")
  end
  def reading_time(text)
    word_count = text.split.size
    words_per_minute = 150
    (word_count.to_f / words_per_minute.to_f).ceil()
  end
end
