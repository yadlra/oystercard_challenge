class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

 def initialize
   @balance = 0


 end

 def top_up(value)
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
  @balance = @balance + value
 end

 def deduct(value)
  @balance -= value
 end



end
