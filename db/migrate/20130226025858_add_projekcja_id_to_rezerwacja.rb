class AddProjekcjaIdToRezerwacja < ActiveRecord::Migration
  def change
  	add_column :rezerwacjas, :projekcja_id, :integer
  	add_index :rezerwacjas, :projekcja_id
  end
end
