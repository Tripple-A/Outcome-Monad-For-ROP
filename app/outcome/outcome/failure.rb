# typed: true

module Outcome
  class ErrorType < T::Enum
    enums do
      InvalidParam = new
      Unauthorized = new
      Forbidden = new
    end
  end

  class Failure < T::Struct
    extend T::Sig

    const :error_message, T.nilable(String)
    const :type, ErrorType, default: ErrorType::InvalidParam
  end
end
