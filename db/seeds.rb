require 'csv'

puts "Importing countries..."
num = 1
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  City.create! do |city|
    city.id = num
    city.country = row[0]
    city.name = row[1]
    num += 1
  end
end
puts num