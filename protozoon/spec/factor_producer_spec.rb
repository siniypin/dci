require_relative './spec_helper'

describe FactorProducer do
  subject { OpenStruct.new(x: 1, has_eye?: true, diploid?: true, ) }

  context ProduceFactorCommand do
    it 'should produce factor proportional to time passed' do
      old_x = subject.x

      result = ProduceFactorCommand.call subject, 1.minute

      expect(result.x - old_x).to be_within(0.001).of(Cell::FACTOR_PRODUCTION_VELOCITY * 1.minute)
    end
  end
end