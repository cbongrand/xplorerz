class AddPriceToItineraries < ActiveRecord::Migration[6.1]
  def change
    add_monetize :itineraries, :price, currency: { present: false }
  end
end
