class AddOrderToBooking < ActiveRecord::Migration[6.1]
  def change
    change_table :bookings do |t|
      t.string :state
      t.string :itinerary_sku
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
    end
  end
end
