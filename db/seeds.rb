Product.delete_all

676.times do
  Product.create(title: Faker::Commerce.product_name,
                 price: Faker::Commerce.price,
                 stock_quantity: Faker::Number.number(digits: 3))
end

puts Product.count
