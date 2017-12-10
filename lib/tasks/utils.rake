namespace :util do
  desc "Cria produtos fake"
  task generate_users: :environment do
    puts "Criando usuarios"

    100.times do
      Product.create!(name: Faker::Commerce.product_name,
                  store_price: Faker::Commerce.price,
                  price_one: Faker::Commerce.price,
                  price_two: Faker::Commerce.price)
  end
  puts "Produtos criado com sucesso"
end


end
