class AddSocialLinks < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :email, :string
    add_column :authors, :linkedin, :string
    add_column :authors, :x, :string
    add_column :authors, :facebook, :string
    add_column :authors, :mastodon, :string
    add_column :authors, :bluesky, :string
  end
end
