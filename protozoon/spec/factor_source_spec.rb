require_relative './spec_helper'

describe FactorSource do
  context TransferFactorCommand do
    context 'substantial environment' do
      it 'should transfer x in direction of gradient' do
        first = OpenStruct.new(cx: 1, x: 1)
        second = OpenStruct.new(cx: 5, x: 5)

        TransferFactorCommand.call first, second, 3.seconds

        expect(first.x).to be_within(0.001).of(1 + (5-1)*Cell::FACTOR_TRANSFER_VELOCITY*3.seconds)
        expect(second.x).to be_within(0.001).of(5 - (5-1)*Cell::FACTOR_TRANSFER_VELOCITY*3.seconds)
      end
    end

    context 'rich cell' do
      it 'should transfer x in direction of gradient' do
        first = OpenStruct.new(cx: 5, x: 5)
        second = OpenStruct.new(cx: 1, x: 1)

        TransferFactorCommand.call first, second, 3.seconds

        expect(first.x).to be_within(0.001).of(5 - (5-1)*Cell::FACTOR_TRANSFER_VELOCITY*3.seconds)
        expect(second.x).to be_within(0.001).of(1 + (5-1)*Cell::FACTOR_TRANSFER_VELOCITY*3.seconds)
      end
    end
  end
end