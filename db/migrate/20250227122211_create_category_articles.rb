class CreateCategoryArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :category_articles do |t|
      t.references :article, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
