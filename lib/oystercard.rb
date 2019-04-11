class Oystercard

  attr_reader :balance, :in_journey



  MAXIMUM_BALANCE = 90
  MIN_FARE = 1

 def initialize
   @balance = 0
   @in_journey = false

 end

 def top_up(value)
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
  @balance = @balance + value
 end


 def touch_in
  raise 'Insufficient funds' if @balance < MIN_FARE
   @journey = true
 end

 def touch_out
   deduct(MIN_FARE)
   @journey = false
 end

 private

 def deduct(value)
  @balance -= value
 end

end
