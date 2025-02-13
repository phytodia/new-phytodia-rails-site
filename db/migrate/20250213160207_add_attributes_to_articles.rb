class AddAttributesToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :title, :text
    add_column :articles, :meta_description, :text
    add_column :articles, :read_time, :integer
    add_column :articles, :intro, :text
    add_column :articles, :indexed, :boolean, default: true
    add_column :articles, :public, :boolean, default: true
    add_column :articles, :follow, :boolean, default: true
    add_column :articles, :canonical, :string
  end
end
