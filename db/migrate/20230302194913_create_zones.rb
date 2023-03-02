class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end
