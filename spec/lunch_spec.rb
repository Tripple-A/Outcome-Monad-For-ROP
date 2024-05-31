require_relative '../app/app'

describe Lunch do
  let(:meal) { 'Pizza' }
  let(:address) { 'London' }
  let(:card_number) { '456781234' }
  subject { Lunch.new(address:, meal:, card_number:).order }
  describe '#order' do
    context 'when the city, meal and card number are valid' do
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

    context 'when the card number is not valid' do
      let(:card_number) { '4567' }
      it 'fails' do
        expect(subject).to eq('Invalid card')
      end
    end
  end
end
