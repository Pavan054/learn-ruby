### Types of Inheritance

## Single Inheritance
# One class inherits from one parent.

class Parent; end
class Child < Parent; end

## Multilevel Inheritance
# A chain of inheritance.

class A; end
class B < A; end
class C < B; end

## Multiple Inheritance (not directly supported in Ruby)
# Ruby doesn’t allow multiple inheritance (class C < A, B is invalid).
# Instead, use Modules + Mixins to achieve similar behavior.
# Interesting Fact: This design choice avoids the Diamond Problem (ambiguity when two parents define the same method).