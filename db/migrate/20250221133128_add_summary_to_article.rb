class AddSummaryToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :summary, :boolean, default: false
  end
end
