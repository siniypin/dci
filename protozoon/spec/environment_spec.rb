require 'spec_helper'

describe ::Environment do

  it 'should live' do
    e = ::Environment.new(100, 0, [DiploidCell.new(10, true)])

    sleep 1
    30.times do
      e.tick 1.second
      e.inspect
      sleep 1
    end
  end
end