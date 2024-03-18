# frozen_string_literal: true

module StringExtensions
  def possessive
    return self if blank?

    "#{self}'#{'s' unless last == 's'}"
  end
end

class String
  include StringExtensions
end
