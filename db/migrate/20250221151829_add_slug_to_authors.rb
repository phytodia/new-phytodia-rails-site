class AddSlugToAuthors < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :slug, :string
    add_index :authors, :slug, unique: true

    add_column :authors, :biography_en, :text
    add_column :authors, :biography_es, :text
    add_column :authors, :biography_de, :text
    rename_column :authors, :biography, :biography_fr

  end
end
