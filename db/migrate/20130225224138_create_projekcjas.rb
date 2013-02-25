class CreateProjekcjas < ActiveRecord::Migration
  def change
    create_table :projekcjas do |t|
    	t.integer :film_id
    	t.date :data
    	t.time :godzina
      t.timestamps
    end
  end
end
