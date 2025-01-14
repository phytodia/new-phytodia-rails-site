class AddEcocertMadeFranceToActifs < ActiveRecord::Migration[7.2]
  def change
    add_column :actifs, :ecocert, :boolean, default: true
    add_column :actifs, :made_in_france, :boolean, default: true
  end
end
