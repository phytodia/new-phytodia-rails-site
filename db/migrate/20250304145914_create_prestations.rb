class CreatePrestations < ActiveRecord::Migration[7.2]
  def change
    create_table :prestations do |t|
      t.text :titre
      t.text :content
      t.string :lang
      t.text :intro
      t.text :title
      t.text :meta_description
      t.boolean :indexed, default: true
      t.boolean :follow, default: true
      t.string :canonical

      t.timestamps
    end
  end
end
