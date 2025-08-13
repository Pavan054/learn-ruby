## Ruby has 4 major types of variable scopes, identified by prefixes:

=begin
| Type           | Syntax  | Scope Level          | Example              |
| -------------- | ------- | -------------------- | -------------------- |
| Local Variable | `name`  | Method, block, class | `age = 25`           |
| Instance Var   | `@var`  | Specific object      | `@name = "Pavan"`    |
| Class Var      | `@@var` | Across all instances | `@@count = 0`        |
| Global Var     | `$var`  | Entire program       | `$app_name = "Test"` |
=end

## Constant scope:
# Starts with uppercase: PI = 3.14
# Can be accessed across modules/classes if namespaced.

## Interesting:
# Constants are not truly constant. You can reassign them with a warning:
PI = 3.14
puts PI

PI = 3.1415  # => warning: already initialized constant
puts PI
