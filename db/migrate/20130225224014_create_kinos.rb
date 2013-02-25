class CreateKinos < ActiveRecord::Migration
  def change
    create_table :kinos do |t|

      t.timestamps
    end
  end
end
