class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.text :titre
      t.text :content

      t.timestamps
    end
  end
end
