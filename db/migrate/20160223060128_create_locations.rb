class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :address
      t.string :category
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
