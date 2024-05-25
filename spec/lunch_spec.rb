require_relative '../app/app'

describe Lunch do
  let(:meal) { 'Pizza' }
  let(:address) { 'London' }
  subject { Lunch.new(address:, meal:).order }
  describe '#order' do
    context 'when the city and meal are valid' do
      it 'delivers successfully' do
        expect(subject).to eq('Pizza succesfully dispatched to London')
      end
    end
    context 'when the meal is not valid' do
      let(:meal) { 'Burger' }
      it 'fails' do
        expect(subject).to eq('Invalid meal')
      end
    end

    context 'when the city is not valid' do
      let(:address) { 'Abuja' }
      it 'fails' do
        expect(subject).to eq('Invalid city')
      end
    end
  end
end
