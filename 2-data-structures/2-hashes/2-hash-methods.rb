# Hash Methods

person = { name: "Pavan Kumar", age: 27, good: true, address: nil }

p person.keys           # returns array of keys

p person.values         # returns array of values

p person.has_key?(:age) # checks key exists or not

contact = { mobile: "6300394363" }

p person.merge(contact)   # merges two hashes

hashh = { a: 1, b: 2, c: 3 }
p hashh.invert

p hashh[:b]         # 2
p hashh.fetch(:b)   # 2

p hashh[:d]         # nil
# p hashh.fetch(:d)   # key not found: :d (KeyError)

p hashh.fetch(:d, "default")    # default
p hashh

hashh.store(:d, 4)
p hashh

p hashh.include?(:d)

p hashh.member?(:d)

p hashh.value?(4)
p hashh.value?(5)
p hashh.has_value?(4)
p hashh.has_value?(5)

p hashh.empty?

p hashh.size

hashh = { a: 1, b: 2, c: 3, d: 4, e: nil }
p hashh.compact
p hashh
p hashh.compact!
p hashh

p hashh.to_a

p hashh.assoc(:a)
p hashh.rassoc(2)

p hashh.dig(:a)

p hashh.fetch_values(:a, :b)