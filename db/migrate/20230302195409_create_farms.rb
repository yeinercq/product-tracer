class CreateFarms < ActiveRecord::Migration[7.0]
  def change
    create_table :farms do |t|
      t.string :name, null: false
      t.string :code
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.references :zone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
