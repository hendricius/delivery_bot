class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :headquarter_id
      t.string :name
      t.string :street
      t.string :city
      t.string :country
      t.string :zipcode

      t.timestamps
    end
  end
end
