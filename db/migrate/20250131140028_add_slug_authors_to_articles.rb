class AddSlugAuthorsToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :slug_authors, :string
  end
end
