class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :headquarter_id
      t.string :name
      t.string :phone
      t.float :home_latitude
      t.float :home_longitude

      t.timestamps
    end
  end
end
