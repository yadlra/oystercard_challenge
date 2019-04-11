
require 'oystercard'

describe Oystercard do
  let(:station) { double }
  it 'checks card balance is zero' do
    expect(subject.balance).to eq (0)
  end
  it 'checks the card has empty list of jorneys'

  it 'checks touching ina nd out creates one journey'


  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it " can top up the balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error if card balance is more then 90" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  it 'starts not in journey' do

    expect(subject.in_journey).to eq false
  end


describe '#touch_in' do

  it 'shows when journey has started' do
    min_fare = Oystercard::MIN_FARE
    subject.instance_variable_set(:@balance, min_fare)
   expect(subject.touch_in(station)).to eq true
  end

  it 'raises error if balance has insufficient funds' do
    expect { subject.touch_in(station) }.to raise_error 'Insufficient funds'
  end

  it 'updates the method to accept the entry station' do
   subject.top_up(5)
   subject.touch_in(station)
   expect(subject.entry_station).to eq station
  end

end

describe '#touch_out' do

  it 'shows when journey has ended' do
    expect(subject.touch_out).to eq false
  end

  it 'charges when the card is touched out' do
    subject.top_up(6)
    subject.touch_in(station)
    expect {subject.touch_out}.to change{subject.balance}.by(- Oystercard::MIN_FARE)
  end

  it 'makes entry station nil' do
    subject.top_up(6)
    subject.touch_in(station)
    subject.touch_out
    expect(subject.entry_station).to eq nil
  end

  it 'accepts exit station'

end
end
