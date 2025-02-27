class Author < ApplicationRecord
  has_many :author_publications
  has_many :articles, through: :author_publications

  has_one_attached :avatar

  extend FriendlyId
  friendly_id :firstname_lastname, use: :slugged

  def firstname_lastname
    "#{firstname.downcase}-#{lastname.downcase}"
  end
end
