class AddCatAndProprietesToActifs < ActiveRecord::Migration[7.2]
  def change
    add_column :actifs, :cat_produits, :text, array: true, default: []
    add_column :actifs, :props_tags, :text, array: true, default: []
  end
end
