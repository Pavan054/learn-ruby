# Performance: Symbol comparison is O(1) because it’s pointer-based, string comparison is O(n).

# Memory Leak Risk (Old Ruby): Creating symbols from user input in old Ruby could crash a server (classic interview trap).

# Rails Fact: Rails uses symbols heavily for params, controller actions, and enumeration.

# Metaprogramming: Methods like define_method and send often take symbols.
class Hello
  define_method(:greet) { puts "Hello!" }
end
Hello.new.greet  # "Hello!"
