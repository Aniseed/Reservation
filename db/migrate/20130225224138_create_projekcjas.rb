class CreateProjekcjas < ActiveRecord::Migration
  def change
    create_table :projekcjas do |t|

      t.timestamps
    end
  end
end
