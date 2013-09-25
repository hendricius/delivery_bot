class AddLocationDataToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :latitude, :float
    add_column :orders, :longitude, :float
    add_column :orders, :gmaps, :boolean
  end
end
