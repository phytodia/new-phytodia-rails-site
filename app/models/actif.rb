class Actif < ApplicationRecord
  has_many_attached :photos
  TYPE_PRODUITS = ["cosmétique","nutraceutique"]
  PROPRIETES = ["minceur","brûle graisse"]
end
