json.extract! customer, :id, :name, :company_name, :cnpj_cpf, :ie_rg, :phone, :cell_phone, :email, :address, :number, :neighborhood, :city, :postal_code, :state, :costumer_type, :created_at, :updated_at
json.url customer_url(customer, format: :json)
