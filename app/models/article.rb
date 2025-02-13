class Article < ApplicationRecord
  has_many :author_publications
  has_many :authors, through: :author_publications
  has_richer_text :content, store_as: :json

  #validates :authors, presence: true


  extend FriendlyId
  friendly_id :titre, use: :slugged

  after_validation :slug_authors, on: [ :create, :update ]


  def slug_authors
    slug = []
    self.authors.each do |author|
      slug << "#{author.firstname.downcase }-#{author.lastname.downcase}"
    end
    self.slug_authors = slug.join("-")
  end
end
