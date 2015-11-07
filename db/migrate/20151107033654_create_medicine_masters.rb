class CreateMedicineMasters < ActiveRecord::Migration
  def change
    create_table :medicine_masters do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
