class AddOrderCapacityToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :capacity, :integer
  end
end
