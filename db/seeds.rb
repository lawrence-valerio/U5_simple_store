require 'csv'

Product.delete_all
Category.delete_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |p|
  category = Category.find_or_create_by(name: p['category'])

  product = category.products.create(
    title: p['name'],
    price: p['price'],
    description: p['description'],
    stock_quantity: p['stock quantity']
  )
end

# 676.times do
#   Product.create(title: Faker::Commerce.product_name,
#                  price: Faker::Commerce.price,
#                  stock_quantity: Faker::Number.number(digits: 3))
# end

puts Product.count
puts Category.count
