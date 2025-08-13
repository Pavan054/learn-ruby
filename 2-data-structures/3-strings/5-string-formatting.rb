# Ruby has sprintf and the % operator.

p sprintf("Name: %s, Age: %d", "Pavan", 30)
# => "Name: Pavan, Age: 30"

p "Name: %s, Age: %d" % ["Pavan", 30]
# => "Name: Pavan, Age: 30"

# Padding and precision
p "%05d" % 42        # "00042"
p "%.2f" % 3.14159   # "3.14"

p "%-10s %04d" % ["Ruby", 42]