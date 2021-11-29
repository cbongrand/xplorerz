class CreateCountryItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :country_itineraries do |t|
      t.references :country, null: false, foreign_key: true
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
