class CreateSnakes < ActiveRecord::Migration
  def change
    create_table :snakes do |t|

      t.timestamps null: false
    end
  end
end
