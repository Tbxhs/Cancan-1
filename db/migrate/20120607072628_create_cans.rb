class CreateCans < ActiveRecord::Migration
  def change
    create_table :cans do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :telephone
      t.integer :price
      t.integer :rate
      t.integer :hot
      t.string :locale
      t.timestamps
    end
  end
end
