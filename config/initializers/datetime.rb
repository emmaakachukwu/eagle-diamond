# frozen_string_literal: true

module DateTimeExtensions
  def to_readable
    format = "#{date_format_prefix},"
    format += ' %Y' unless year == Time.zone.now.year
    format += ' %I:%M %p'

    strftime format
  end

  def date_format_prefix
    case self
    when today?
      'Today'
    when yesterday?
      'Yesterday'
    when 6.days.ago..Time.zone.now
      '%A'
    else
      '%B %d'
    end
  end
end

ActiveSupport::TimeWithZone.class_eval do
  include DateTimeExtensions
end
