# typed: true

module Outcome
  def self.success(value)
    OutcomeType.new(Success.new(value:))
  end

  def self.error(message)
    OutcomeType.new(Error.new(message:))
  end
end
