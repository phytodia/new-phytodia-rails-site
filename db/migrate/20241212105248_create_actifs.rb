class CreateActifs < ActiveRecord::Migration[7.2]
  def change
    create_table :actifs do |t|
      t.string :name
      t.text :description
      t.text :composition
      t.text :proprietes
      t.text :types_produits
      t.text :cible
      t.text :efficacite
      t.text :donnees
      t.text :concentration
      t.string :lang

      t.timestamps
    end
  end
end
