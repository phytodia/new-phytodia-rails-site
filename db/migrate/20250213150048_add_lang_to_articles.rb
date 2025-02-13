class AddLangToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :lang, :string
  end
end
