=begin
| Operator | Meaning        | Example  | Result |
| -------- | -------------- | -------- | ------ |
| `+`      | Addition       | `2 + 3`  | `5`    |
| `-`      | Subtraction    | `5 - 2`  | `3`    |
| `*`      | Multiplication | `4 * 3`  | `12`   |
| `/`      | Division       | `10 / 2` | `5`    |
| `%`      | Modulus        | `7 % 3`  | `1`    |
| `**`     | Exponentiation | `2 ** 3` | `8`    |
=end

puts 2 + 3, 5 - 2, 4 * 3, 10 / 2, 7 % 3, 2 ** 3

## Division Caveat:
puts 10 / 4     # => 2 (Integer division)
puts 10 / 4.0   # => 2.5 (Float division)