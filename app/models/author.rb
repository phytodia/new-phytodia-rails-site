class Author < ApplicationRecord
  has_many :author_publications
  has_many :articles, through: :author_publications
end
