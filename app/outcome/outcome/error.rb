# typed: true

module Outcome
  class Error < T::Struct
    extend T::Sig

    const :message, String
    const :exception, Exception, default: StandardError.new
  end
end
