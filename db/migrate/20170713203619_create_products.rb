class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :store_price
      t.decimal :price_one
      t.decimal :price_two

      t.timestamps null: false
    end
  end
end
