class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :films, :kino_id
  	add_index :projekcjas, :film_id
  end
end
