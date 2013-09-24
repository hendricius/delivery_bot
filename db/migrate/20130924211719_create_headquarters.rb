class CreateHeadquarters < ActiveRecord::Migration
  def change
    create_table :headquarters do |t|
      t.string :name

      t.timestamps
    end
  end
end
