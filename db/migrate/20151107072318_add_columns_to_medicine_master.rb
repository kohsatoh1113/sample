class AddColumnsToMedicineMaster < ActiveRecord::Migration
  def change
    add_column :medicine_masters, :yomi, :string
  end
end
