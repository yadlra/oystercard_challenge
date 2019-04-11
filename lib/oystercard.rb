class Oystercard

  attr_reader :balance, :in_journey, :entry_station



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


 def touch_in(station)
  raise 'Insufficient funds' if @balance < MIN_FARE
   @entry_station = station
   @in_journey = true
 end

 def touch_out
   @entry_station = nil
   deduct(MIN_FARE)
   @in_journey = false
 end

 def in_journey?
   !!entry_station
 end

 private

 def deduct(value)
  @balance -= value
 end

end
