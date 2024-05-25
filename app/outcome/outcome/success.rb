# typed: true

module Outcome
  class Success < T::Struct
    extend T::Sig

    const :value, T.untyped
  end
end
