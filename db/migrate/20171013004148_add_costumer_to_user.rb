class AddCostumerToUser < ActiveRecord::Migration
  def change
    add_column :users, :costumer_type, :integer
  end
end
