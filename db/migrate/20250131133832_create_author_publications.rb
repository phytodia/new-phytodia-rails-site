class CreateAuthorPublications < ActiveRecord::Migration[7.2]
  def change
    create_table :author_publications do |t|
      t.references :author, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
