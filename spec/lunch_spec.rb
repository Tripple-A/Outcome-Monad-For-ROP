require_relative '../app/app'

describe Lunch do
  let(:meal) { 'Pizza' }
  let(:address) { 'London' }
  let(:card_number) { '1234' }
  subject { Lunch.new(address:, meal:, card_number:).order }
  describe '#order' do
    context 'when the city, meal and card are valid' do
      it 'delivers successfully' do
        expect(subject.success?).to be(true)
      end
    end
    context 'when the meal is not valid' do
      let(:meal) { 'Burger' }
      it 'fails' do
        expect(subject.failure?).to be(true)
      end
    end

    context 'when the city is not valid' do
      let(:address) { 'Abuja' }
      it 'fails' do
        expect(subject.failure?).to be(true)
        expect(subject.error_type).to eq(Outcome::ErrorType::InvalidParam)
      end
    end

    context 'when the card is not valid' do
      let(:card_number) { 'XXX' }
      it 'fails' do
        expect(subject.failure?).to be(true)
        expect(subject.error_type).to eq(Outcome::ErrorType::Forbidden)
      end
    end
  end
end
