class Oystercard
MAXIMUM_BALANCE = 90
  attr_reader :balance

 def initialize
   @balance = 0
 end

def top_up(value)
  @balance = @balance + value
  raise "Maximum balance exceeded" if @balance + value > MAXIMUM_BALANCE
end

def deduct(value)
  @balance -= value
end
end
