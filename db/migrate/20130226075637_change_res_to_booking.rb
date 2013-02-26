class ChangeResToBooking < ActiveRecord::Migration
  def up
  	rename_table :reservations, :bookings
  end

  def down
  	rename_table :bookings, :reservations
  end
end
