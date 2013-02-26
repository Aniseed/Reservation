class RenameTables < ActiveRecord::Migration
  def up
  	rename_table :kinos, :cinemas
  	remove_index :films, :kino_id
  	rename_column :films, :kino_id, :cinema_id
  	rename_table :films, :movies
  	add_index :movies, :cinema_id
  	remove_index :projekcjas, :film_id
  	rename_column :projekcjas, :film_id, :movie_id
  	rename_table :projekcjas, :projections
  	add_index :projections, :movie_id
  	remove_index :rezerwacjas, :projekcja_id
  	rename_column :rezerwacjas, :projekcja_id, :projection_id
  	rename_table :rezerwacjas, :reservations
  	add_index :reservations, :projection_id
  end

  def down
  	rename_table :cinemas, :kinos
  	remove_index :movies, :cinema_id
  	rename_column :movies, :cinema_id, :kino_id
  	rename_table :movies, :films
  	add_index :movies, :kino_id
  	remove_index :projections, :movie_id
  	rename_column :projections, :movie_id, :film_id
  	rename_table :projections, :projekcjas
  	add_index :projekcjas, :film_id
  	remove_index :reservations, :projection_id
  	rename_column :reservations, :projection_id, :projekcja_id
  	rename_table :reservations, :rezerwacjas
  	add_index :reserwacjas, :projekcja_id
  end
end
