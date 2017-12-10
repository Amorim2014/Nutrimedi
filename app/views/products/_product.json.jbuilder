json.extract! product, :id, :name, :store_price, :price_one, :price_two, :created_at, :updated_at
json.url product_url(product, format: :json)
