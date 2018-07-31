class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
