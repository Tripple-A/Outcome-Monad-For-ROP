# typed: true

module Outcome
  class OutcomeType
    extend T::Sig

    sig { params(obj: T.any(Success, Failure)).void }
    def initialize(obj)
      @obj = obj
    end

    def success?
      @obj.is_a?(Success)
    end

    sig { returns(T::Boolean) }
    def failure?
      @obj.is_a?(Failure)
    end

    def bind
      return self if @obj.is_a?(Failure)

      yield @obj.value
    end

    def error_type
      return nil if success?

      @obj.type
    end
  end
end
