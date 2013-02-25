class CreateKinos < ActiveRecord::Migration
  def change
    create_table :kinos do |t|
    	t.string :nazwa
  		t.float :szerokosc
  		t.float :dlugosc
      t.timestamps
    end
  end
end
