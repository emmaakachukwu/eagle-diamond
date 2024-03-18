# frozen_string_literal: true

module ApplicationHelper
  def custom_format_date(date_obj)
    format = "#{date_format_prefix(date_obj)},"
    format += ' %Y' unless date_obj.year == Time.zone.now.year
    format += ' %I:%M %p'

    date_obj.strftime format
  end

  private

  def date_format_prefix(date_obj)
    if date_obj.today?
      'Today'
    elsif date_obj.yesterday?
      'Yesterday'
    elsif ((6.days.ago)..(Time.zone.now)).cover? date_obj
      '%A'
    else
      '%B %d'
    end
  end
end
