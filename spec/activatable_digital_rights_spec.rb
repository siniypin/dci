require 'spec_helper'

describe ActivatableDigitalRights do
  subject { ActivatableDigitalRights.new ActivationResult.new }

  it 'should have activation data' do
    expect(subject.activation_info).not_to be_nil
  end

  it 'should have expiration date calculated by activation' do
    result = ActivationResult.new
    result.expiration_date = DateTime.now
    sut = ActivatableDigitalRights.new result
    expect(sut.expiration_date).to eq(result.expiration_date)
  end

  it 'should have expiration type fixed' do
    result = ActivationResult.new
    result.expiration_date = DateTime.now
    sut = ActivatableDigitalRights.new result
    expect(sut.expiration_type).to eq(:fixed)
  end
end