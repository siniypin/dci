require 'spec_helper'

describe DigitalRights do
  shared_examples_for :not_expiring do
    it 'should not be expiring' do
      expect(subject.expiring?).to be_false
    end

    it 'should not be expired' do
      expect(subject.expired?).to be_false
    end
  end

  context 'as unlimited' do
    subject { DigitalRights.new.extend Unlimited }

    it 'should have infinite expiration date' do
      expect(subject.expiration_date).to be_a(Date::Infinity)
    end

    it_behaves_like :not_expiring
  end

  context 'as activatable' do
    subject { DigitalRights.new.extend Activatable }

    context 'not yet activated' do
      before { subject.activation_result = ActivationResult.new }

      it 'should be not activated' do
        expect(subject.activated?).to be_false
      end

      it 'should have zero expiration date' do
        expect(subject.expiration_date).to eq(DateTime.parse("0001-01-01"))
      end

      it_behaves_like :not_expiring
    end

    context 'activated' do
      before { subject.activation_result = ActivationResult.new activation_date: 1.day.ago }

      it 'should be activated' do
        expect(subject.activated?).to be_true
      end

      context 'calculated duration not exceeds ultimate expiration date' do
        before { subject.activation_result = ActivationResult.new activation_date: 1.day.ago, rights_term: 1.month, expiration_date: 1.month.from_now }

        it 'should override ultimate expiration date' do
          expect(subject.expiration_date).not_to eq(subject.activation_result.expiration_date)
        end

        it_behaves_like :not_expiring
      end

      context 'calculated duration exceeds ultimate expiration date' do
        before { subject.activation_result = ActivationResult.new activation_date: 1.day.ago, rights_term: 2.month, expiration_date: 1.month.from_now }

        it 'should not override ultimate expiration date' do
          expect(subject.expiration_date).to eq(subject.activation_result.expiration_date)
        end

        it_behaves_like :not_expiring
      end
    end
  end

  context 'as freemium upsell target' do
    subject { DigitalRights.new.extend UpsellTarget }

    it 'should always suggest to upgrade to premium' do
      expect(subject.required_offer_type).to eq(:buy)
    end
  end
end