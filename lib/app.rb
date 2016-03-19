require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

def line(len)
  #This function prints asterisks
  
  puts '*' * len

end

# Print today's date
require 'date'

puts
puts "Today's Date: #{Date.today.to_s}"


puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
puts

# Create a new hash for brands
brands_hash = Hash.new

# For each product in the data set:
products_hash["items"].each do |toy|
  
  # Print the name of the toy
  puts "#{toy["title"]}"

  # Print asterisks 
  line(toy["title"].length + 1)

  # Print the retail price of the toy
  ret_price = toy["full-price"].to_f
  puts "Retail Price: $#{ret_price}"

  # Calculate and print the total number of purchases
  total_number = toy["purchases"].length
  puts "Total Purchases: #{total_number}"

  # Calculate and print the total amount of sales
  total_purchases = 0
  toy["purchases"].each { |purchase|  total_purchases += purchase["price"]}
  puts "Total Sales: $#{total_purchases}"

  # Calculate and print the average price the toy sold for
  avg_price = total_purchases / total_number
  puts "Average Price: $#{avg_price}"

  # Calculate and print the average discount (% or $) based off the average sales price
  avg_disc = (ret_price - avg_price) / ret_price * 100
  puts "Average Discount: #{avg_disc.round(2)}%"

  puts

  # Get brand info here, no need to loop one more time
  
  # Get the brand name
  brand = toy["brand"]

  # Assign initial values of each brand as 0
  brands_hash[brand] = {stock: 0, number_of_products: 0, total_price: 0, revenue: 0} unless brands_hash.key?(brand)
  
  # Increase brands stock value
  brands_hash[brand][:stock] += toy["stock"].to_f

  # Increase brands number of products
  brands_hash[brand][:number_of_products] += 1
  
  # Increase brands retail price
  brands_hash[brand][:total_price] += ret_price
  
  # Increase brands total sales
  brands_hash[brand][:revenue] += total_purchases

end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
brands_hash.each do |key, values|

  # Print the name of the brand
  puts "#{key}"

  # Print asterisks
  line(key.length + 1)

  # Count and print the number of the brand's toys we stock
  puts "Number Of Products: #{(values[:stock]).round(0)}"

  # Calculate and print the average price of the brand's toys
  avg_price = (values[:total_price] / values[:number_of_products]).round(2)
  puts "Average Product Price: $#{avg_price}"

  # Calculate and print the total revenue of all the brand's toy sales combined
  puts "Total Sales: $#{(values[:revenue]).round(2)}"

  puts

end
 