class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :content
      t.integer :driver_id
      t.integer :company_id

      t.timestamps
    end
  end
end
