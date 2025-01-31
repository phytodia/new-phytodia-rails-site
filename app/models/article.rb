class Article < ApplicationRecord
  has_many :authors
  has_richer_text :content, store_as: :json
end
