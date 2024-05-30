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

      T.cast(@obj, Failure).type
    end

    def map(&_block)
      return OutcomeType.new(@obj) unless success?

      value = yield T.cast(@obj, Success).value
      Outcome.success(value)
    end

    def unwrap!
      return T.cast(@obj, Success).value if success?

      raise UnwrapError, T.cast(@obj, Failure)
    end
  end
end
