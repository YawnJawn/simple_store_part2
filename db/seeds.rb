require 'csv'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Populating with Faker

Product.destroy_all
Category.destroy_all

#676.times do |f|
    #Product.create( title: Faker::Coffee.blend_name,
   #                 price: Faker::Commerce.price,
  #                  stock_quantity: Faker::Number.number(digits: 2)
 #                   )
#end

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product|
    category = Category.find_or_create_by(name: product[4])

    Product.create( title: product[0],
                    price: product[1],
                    description: product[2],
                    stock_quantity: product[3],
                    category: category
                    )
end
puts "Created #{Product.count} products."
