# typed: true

class Lunch
  extend T::Sig
  VALID_CITIES = %w[London Paris Berlin].freeze
  AVAILABLE_MEALS = %w[Pizza Pasta].freeze

  def initialize(address:, meal:, card_number:)
    @address = address
    @meal = meal
    @card_number = card_number
  end

  def order
    address_is_valid?.bind do |address|
      meal_is_available?.bind do |meal|
        payment_is_successful?.bind do |_card_number|
          Outcome.success("#{meal} succesfully dispatched to #{address}")
        end
      end
    end
  end

  private

  def address_is_valid?
    VALID_CITIES.include?(@address) ? Outcome.success(@address) : Outcome.failure('Invalid city')
  end

  def meal_is_available?
    AVAILABLE_MEALS.include?(@meal) ? Outcome.success(@meal) : Outcome.failure('Invalid meal')
  end

  def payment_is_successful?
    # call an external service to make payment
    @card_number.end_with?('1234') ? Outcome.success(@card_number) : Outcome.forbidden
  end
end
