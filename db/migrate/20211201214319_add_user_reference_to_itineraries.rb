class AddUserReferenceToItineraries < ActiveRecord::Migration[6.1]
  def change
    add_reference :itineraries, :user, null: false, foreign_key: true
  end
end
