class RemoveCustumerFromOrder < ActiveRecord::Migration
  def change
  	remove_column :orders, :customer_id
  	add_column :orders, :user_id, :integer
  end
end