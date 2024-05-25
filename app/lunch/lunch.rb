# typed: true

class Lunch
  extend T::Sig
  VALID_CITIES = %w[London Paris Berlin].freeze
  AVAILABLE_MEALS = %w[Pizza Pasta].freeze

  def initialize(address:, meal:)
    @address = address
    @meal = meal
  end

  def order
    return 'Invalid city' unless address_is_valid
    return 'Invalid meal' unless meal_is_available
    return 'dispatched failed, please try again' unless order_dispatched

    "#{@meal} succesfully dispatched to #{@address}"
  end

  private

  def address_is_valid
    VALID_CITIES.include?(@address)
  end

  def meal_is_available
    AVAILABLE_MEALS.include?(@meal)
  end

  def order_dispatched
    # call an external service to dispatch the order
    true
  end
end
