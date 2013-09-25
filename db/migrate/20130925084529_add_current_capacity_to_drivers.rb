class AddCurrentCapacityToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :current_capacity, :integer
  end
end
