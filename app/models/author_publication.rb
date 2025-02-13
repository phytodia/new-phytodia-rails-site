class AuthorPublication < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :article
end
