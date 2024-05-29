# typed: true

module Outcome
  def self.success(value)
    OutcomeType.new(Success.new(value:))
  end

  def self.failure(error_message)
    OutcomeType.new(Failure.new(error_message:))
  end

  def self.forbidden(error_message: nil)
    OutcomeType.new(Failure.new(error_message:, type: ErrorType::Forbidden))
  end
end
