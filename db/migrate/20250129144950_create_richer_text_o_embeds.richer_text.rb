# This migration comes from richer_text (originally 20230926034114)
class CreateRicherTextOEmbeds < ActiveRecord::Migration[7.0]
  def change
    create_table :richer_text_o_embeds do |t|
      t.json :fields
      t.string :url

      t.timestamps
    end
  end
end
