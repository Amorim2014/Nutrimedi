class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :company_name
      t.string :cnpj_cpf
      t.string :ie_rg
      t.string :phone
      t.string :cell_phone
      t.string :email
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :postal_code
      t.string :state
      t.integer :costumer_type

      t.timestamps null: false
    end
  end
end