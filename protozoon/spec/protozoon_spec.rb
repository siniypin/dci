require_relative './spec_helper'

describe Protozoon do
  context DevelopEyeCommand do
    context DiploidCell do
      context 'Cx is less then 1' do
        subject { OpenStruct.new cx: 0.2, has_eye?: false, diploid?: true }

        it 'should not develop an eye' do
          DevelopEyeCommand.call subject

          expect(subject.has_eye).to be_false
        end
      end

      context 'Cx is greater then 1' do
        subject { OpenStruct.new cx: 1.1, has_eye?: false, diploid?: true }

        it 'should develop an eye' do
          DevelopEyeCommand.call subject

          expect(subject.has_eye).to be_true
        end
      end
    end

    context HaploidCell do
      subject { OpenStruct.new cx: 1.1, has_eye?: false, diploid?: false }

      it 'should not develop an eye' do
        DevelopEyeCommand.call subject

        expect(subject.has_eye).to be_false
      end
    end
  end

  context DivideCommand do
    shared_examples_for :meiosis do
      it 'should divide meiosis' do
        result = DivideCommand.call subject

        expect(result).to have(4).items
        expect(result.any? &:diploid?).to be_false
        expect(result.first).not_to equal(subject)
      end

      it 'should divide x unequally' do
        result = DivideCommand.call subject

        expect(result[0].x).to eq(subject.x*3/8)
        expect(result[1].x).to eq(subject.x*2/8)
        expect(result[2].x).to eq(subject.x*2/8)
        expect(result[3].x).to eq(subject.x*1/8)
      end
    end

    context 'immature cell' do
      subject do
        cell = DiploidCell.new 4, true
        Timecop.travel(Time.now + 1.second)
        cell
      end

      it 'should not divide' do
        result = DivideCommand.call subject

        expect(result).to equal(subject) #same object
      end
    end

    context 'mature cell' do
      context DiploidCell do
        context 'Cx is less then 4' do
          subject do
            cell = DiploidCell.new 2, false
            Timecop.travel(Time.now + 1.minute)
            cell
          end

          it_behaves_like :meiosis
        end

        context 'Cx is greater then 4' do
          subject do
            cell = DiploidCell.new 4.1, false
            Timecop.travel(Time.now + 1.minute)
            cell
          end

          it 'should divide mitosis' do
            result = DivideCommand.call subject

            expect(result).to have(2).items
            expect(result.all? &:diploid?).to be_true
            expect(result.first).not_to equal(subject)
          end

          it 'should divide x unequally' do
            result = DivideCommand.call subject

            expect(result[0].x).to eq(subject.x*2/3)
            expect(result[1].x).to eq(subject.x*1/3)
          end

          it 'should pass an eye to the first daughter cell' do
            result = DivideCommand.call subject

            expect(result.first.has_eye?).to be_true
            expect(result.last.has_eye?).to be_false
          end
        end
      end

      context HaploidCell do
        subject do
          cell = HaploidCell.new 4.1
          Timecop.travel(Time.now + 1.minute)
          cell
        end

        it_behaves_like :meiosis
      end
    end
  end
end