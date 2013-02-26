class CreateRezerwacjas < ActiveRecord::Migration
  def change
    create_table :rezerwacjas do |t|
    	t.datetime :termin
    	t.string :imie
    	t.string :nazwisko
    	t.string :email
    	t.string :numer
    	t.integer :bilety_normalne
    	t.integer :bilety_ulgowe

      t.timestamps
    end
  end
end
