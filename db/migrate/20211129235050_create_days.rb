class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.string :city
      t.text :description
      t.references :itinerary, null: false, foreign_key: true
      t.text :restaurant_info
      t.text :activity_info
      t.text :extra_info
      t.integer :order
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
