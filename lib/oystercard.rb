class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history

  MAXIMUM_BALANCE = 90
  MIN_FARE = 1

 def initialize
   @balance = 0
   @in_journey = false
   @journey_history = []
 end

 def top_up(value)
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
  @balance = @balance + value
 end


 def touch_in(station)
   raise 'Insufficient funds' if @balance < MIN_FARE
   @exit_station = nil
   @entry_station = station
   @in_journey = true
 end

 def touch_out(station)
   @entry_station = nil
   deduct(MIN_FARE)
   @exit_station = station
   add_journey
   @entry_station = nil
   # @in_journey = false
 end

 def add_journey
   journey = { :entry => entry_station, :exit => exit_station}
   @journey_history << journey
 end

 def in_journey?
   !!entry_station
 end

 private

 def deduct(value)
  @balance -= value
 end

end
