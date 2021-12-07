class AddLikersCountToItineraries < ActiveRecord::Migration[6.1]
  def change
    add_column :itineraries, :likers_count, :integer, default: 0
  end
end
