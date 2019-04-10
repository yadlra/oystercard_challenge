require 'journey'
describe Journey do

describe '#initialize' do
  it 'starts with false' do
  expect(subject.in_journey).to eq false
  end
end

 describe '#touch_in' do
   it 'shows when journey has started' do
   # it { is_expected.to respond_to :touch_in }
   expect(subject.touch_in).to eq true
 end
end
 describe '#touch_out' do
  it 'shows when journey has ended' do
    expect(subject.touch_out).to eq false 
  end
 end
end
