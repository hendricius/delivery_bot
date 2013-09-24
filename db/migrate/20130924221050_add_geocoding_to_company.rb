class AddGeocodingToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :longitude, :float
    add_column :companies, :latitude, :float
  end
end
