require 'spec_helper'

describe DigitalRights do
  subject { DigitalRights.new :fixed }

  it 'should be time constrained' do
    expect(subject.expiration_date).not_to be_nil
  end

  it 'should specify expiration type' do
    expect(subject.expiration_type).not_to be_nil
  end

  it 'should report infinity as expiration date for expiration type never' do
    sut = DigitalRights.new :never
    expect(sut.expiration_date).to eq(Date::Infinity.new)
  end

  it 'should report supplied date as expiration for fixed expiration type' do
    sut = DigitalRights.new :never, DateTime.now
    expect(sut.expiration_date).to eq(DateTime.now)
  end
end