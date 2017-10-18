require 'net/http'
require 'csv'

PRODUCT_CSV_URL = 'https://raw.githubusercontent.com/bonobos/fullstack_homework/master/products.csv'

VARIANT_CSV_URL = 'https://raw.githubusercontent.com/bonobos/fullstack_homework/master/inventory.csv'

product_csv = Net::HTTP.get(URI.parse(PRODUCT_CSV_URL)).gsub("\", \"", "\",\"")
variant_csv = Net::HTTP.get(URI.parse(VARIANT_CSV_URL)).gsub(', ', ',')

[Variant, Product].each(&:delete_all)

ActiveRecord::Base.connection.reset_pk_sequence!('variants')

CSV.parse(product_csv, headers: true) do |row|
  Product.create!(id: row['product_id'],
                  name: row['product_name'],
                  description: row['product_description'],
                  image: row['product_image'])
end

CSV.parse(variant_csv, headers: true) do |row|
  Variant.create!(row.to_hash)
end

