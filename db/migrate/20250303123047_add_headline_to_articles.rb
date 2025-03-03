class AddHeadlineToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :headline, :boolean, default: false
  end
end
