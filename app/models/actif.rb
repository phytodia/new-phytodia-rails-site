class Actif < ApplicationRecord
  has_many_attached :photos
  has_one_attached :document
  TYPE_PRODUITS = ["cosmétique","nutraceutique"]
  PROPRIETES = ["minceur","brûle graisse"]
end
