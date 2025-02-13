# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Actif.create!(name:"Sarise bio",lang:"fr")
Actif.create!(name:"Corymox",lang:"fr")
Actif.create!(name:"Oleavita",lang:"fr")
Actif.create!(name:"Matribis Bio",lang:"fr")
Actif.create!(name:"Abiewhite",lang:"fr")
Actif.create!(name:"Sinawhite",lang:"fr")
Actif.create!(name:"Rosastase",lang:"fr")
Actif.create!(name:"Corolea+",lang:"fr")
Actif.create!(name:"Melyoferm",lang:"fr")
Actif.create!(name:"Sambulite",lang:"fr")
Actif.create!(name:"Lonhydra",lang:"fr")

Author.create!(lastname:"Belin",firstname:"Nicolas")
Author.create!(lastname:"Junk",firstname:"Celia")
