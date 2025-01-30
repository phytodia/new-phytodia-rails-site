class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :lastname
      t.string :firstname
      t.text :function
      t.text :biography

      t.timestamps
    end
  end
end
