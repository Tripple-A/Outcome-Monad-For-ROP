# typed: true

module Outcome
  class UnwrapError < StandardError
    extend T::Sig

    attr_reader :error

    sig { params(error: Failure).void }
    def initialize(error)
      @error = error
      super
    end
  end
end
