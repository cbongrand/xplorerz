class CreateItineraryTags < ActiveRecord::Migration[6.1]
  def change
    create_table :itinerary_tags do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
