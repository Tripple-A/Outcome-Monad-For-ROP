# typed: strict

module Outcome
  class OutcomeType
    extend T::Sig
    include Outcome

    sig { params(obj: T.any(Success, Error)).void }
    def initialize(obj)
      @obj = obj
    end

    sig { returns(T::Boolean) }
    def successful?
      @obj.is_a?(Success)
    end

    sig { returns(T::Boolean) }
    def error?
      @obj.is_a?(Error)
    end

    sig { returns(T.untyped) }
    def value
      return nil if @obj.is_a?(Error)

      @obj.value
    end

    sig { returns(T.nilable(Error)) }
    def error
      return nil unless @obj.is_a?(Error)

      @obj
    end

    sig { returns(T.untyped) }
    def unwrap!
      content = @obj
      return content.value if content.is_a?(Success)

      raise_error(content)
    end

    sig { params(content: Error).void }
    def raise_error(content)
      raise content.error, content.message
    end

    sig { params(_block: T.untyped).returns(T.untyped) }
    def bind(&_block)
      # return result unless block_given?

      if @obj.is_a?(Success)
        yield @obj.value
      else
        OutcomeState.new(@obj)
      end
    end
  end
end
