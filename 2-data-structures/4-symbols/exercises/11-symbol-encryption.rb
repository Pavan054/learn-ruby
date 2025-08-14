### Symbol Encryption

# Challenge:
# Encrypt the string version of a symbol using a Caesar cipher (shift letters by 3) and return it as a new symbol.

# Example:
# :abc  → :def

def caesar_symbol(sym)
    shift = sym.length # we can keep any number based on the requirement
    str = sym.to_s
    encrypted = String.new(capacity: str.size)

    str.each_char do |ch|
        if ch >= 'a' && ch <= 'z'
        encrypted << ((ch.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr
        elsif ch >= 'A' && ch <= 'Z'
        encrypted << ((ch.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
        else
        encrypted << ch # keep non-letters unchanged
        end
    end

    encrypted.to_sym
end

p caesar_symbol(:abc)    # => :def
p caesar_symbol(:xyz)    # => :abc
p caesar_symbol(:Ruby)   # => :Vyfc

# Complexity:
# Time: O(k) — where k is the length of the symbol’s name.
# Space: O(k) — for the new encrypted string (and the resulting symbol).