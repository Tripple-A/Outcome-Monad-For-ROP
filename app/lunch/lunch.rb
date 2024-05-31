# typed: true

class Lunch
  extend T::Sig
  VALID_CITIES = %w[London Paris Verona].freeze
  AVAILABLE_MEALS = %w[Pizza Pasta].freeze

  def initialize(address:, meal:, card_number:)
    @address = address
    @meal = meal
    @card_number = card_number
  end

  def order
    return 'Invalid city' unless address_is_valid?
    return 'Invalid meal' unless meal_is_available?
    return 'Invalid card' unless payment_is_succesful?

    "#{@meal} succesfully dispatched to #{@address}"
  end

  private

  def address_is_valid?
    VALID_CITIES.include?(@address)
  end

  def meal_is_available?
    AVAILABLE_MEALS.include?(@meal)
  end

  def payment_is_succesful?
    # call an external service to make payment
    @card_number.end_with?('1234')
  end
end
