class Prestation < ApplicationRecord
  CATEGORIES = ["laboratoire des plantes","laboratoire analyses","laboratoire cosmetologie"]
  has_richer_text :content, store_as: :json
end
