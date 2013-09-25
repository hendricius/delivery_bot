class AddMaxCapacityToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :max_capacity, :integer
  end
end
