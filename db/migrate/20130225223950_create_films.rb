class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
    	t.integer :kino_id
    	t.string :tytul
    	t.integer :rok
      t.timestamps
    end
  end
end
