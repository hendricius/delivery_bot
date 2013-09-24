class AddLocationDataToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :city, :string
    add_column :drivers, :street, :string
    add_column :drivers, :country, :string
    add_column :drivers, :zipcode, :string
  end
end
