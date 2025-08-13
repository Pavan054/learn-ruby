### Conversion

p :pavan.to_s         # "pavan"
p :pavan.id2name      # "pavan" (alias for to_s)
p "pavan".to_sym      # :pavan

### Comparison
p :abc == :abc        # true
p :abc.eql?(:abc)     # true
p :abc.equal?(:abc)   # true (same object)
p :abc <=> :bcd       # -1, 0, or 1 (comparison)
p :abc <=> :abc
p :bcd <=> :abc

### Inspection
p :hello.inspect      # ":hello"

### Enumeration
# Iterate over all symbols (CAUTION: huge list)
p Symbol.all_symbols.first(5)
# => [:!, :"\"", :"#", :"$", :%]

### Case Conversion
p :hello.capitalize   # :Hello
p :hello.upcase       # :HELLO
p :Hello.downcase     # :hello

### Pattern Matching
p :hello.match?(/h/)        # true
p :hello.match?(/h/)        # true
p :hello.match?(/hE/)       # false

### Other Utility
p :abc.length         # 3
p :abc.size           # 3 (alias)

