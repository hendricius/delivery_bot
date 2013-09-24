class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :street
      t.string :zipcode
      t.string :country
      t.float :latitute
      t.float :longitude

      t.timestamps
    end
  end
end
