### Method Visibility

# Public: Default — can be called from anywhere.
# Private: Can only be called inside the class, without an explicit receiver.
# Protected: Can be called from instances of the same class or subclasses.

class Example
  def public_method
    "Public"
  end

  private
  def private_method
    "Private"
  end

  protected
  def protected_method
    "Protected"
  end
end

## Interview trap: Private methods can’t be called with an explicit receiver — even self.

### Example
class BankAccount
  attr_reader :owner

  def initialize(owner, balance)
    @owner = owner
    @balance = balance
  end

  # Public method — can be called from anywhere
  def display_balance
    puts "Balance for #{owner}: ₹#{@balance}"
  end

  # Public method calling a private method internally
  def withdraw(amount)
    if sufficient_funds?(amount)
      @balance -= amount
      puts "Withdrew ₹#{amount}. New balance: ₹#{@balance}"
    else
      puts "Insufficient funds!"
    end
  end

  protected
  # Protected — can be called by other objects of the same class or subclasses
  def balance
    @balance
  end

  private
  # Private — only accessible inside the class (no explicit receiver)
  def sufficient_funds?(amount)
    @balance >= amount
  end
end

# ---- Usage ----
account1 = BankAccount.new("Pavan", 5000)
account2 = BankAccount.new("Deepika", 3000)

account1.display_balance     # ✅ Allowed
account1.withdraw(1000)      # ✅ Allowed
# account1.sufficient_funds?(500) # ❌ NoMethodError (private method)

# Demonstrating protected
# puts account1.balance        # ❌ NoMethodError (protected method)
# But works if accessed inside another instance method of the same class

# How it works in interviews:
# Public methods → Accessible from anywhere.
# Private methods → Cannot be called with an explicit receiver (self or object). Only callable implicitly inside the defining class.
# Protected methods → Accessible inside the class and its subclasses, and between instances of the same class, but still not from the outside world.

## Quick Interview Gotcha Question

# Why would you use protected for balance here?
# Because we might want to compare balances between two accounts without exposing them publicly.

# Example:
class BankAccount
  # ... previous code ...

  def richer_than?(other_account)
    balance > other_account.balance # Works because 'balance' is protected
  end
end

puts account1.richer_than?(account2) # true or false
