person = { name: "Pavan Kumar", age: 27, good: true, address: nil }

person.each do |key, value|
    puts "#{key} => #{value}"
end

person.each do |key, value|
    value = "Data not found" if value.nil?
    puts "#{key} => #{value}"
end

person.each_key { |key| puts key }

person.each_value { |value| puts value }

hashh = { a: 1, b: 2, c: 3, d: 4 }
p hashh.map { |key, value| [key.to_s, value * 5] }.to_h