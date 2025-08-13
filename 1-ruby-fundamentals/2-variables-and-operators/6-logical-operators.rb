=begin
| Operator | Name | Example         | Result  |        |   |         |        |
| -------- | ---- | --------------- | ------- | ------ | - | ------- | ------ |
| `&&`     | AND  | `true && false` | `false` |        |   |         |        |
| \`       |      | \`              | OR      | \`true |   | false\` | `true` |
| `!`      | NOT  | `!true`         | `false` |        |   |         |        |
=end

# Difference between && vs and, || vs or:
# && and || have higher precedence
# and and or are used for control flow

# Different result due to precedence
p x = false || true
p x = true || true
p x = false || false

p x = false or true
p x = true or true
p x = false or false

p x = false && true
p x = true && true
p x = false && false

p x = false and true
p x = true and true
p x = false and false

# Use && and || in conditions, and and or for flow control.