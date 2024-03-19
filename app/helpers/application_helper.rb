# frozen_string_literal: true

module ApplicationHelper
  def matches_current_page?(path)
    current_page?(path) || request.path.starts_with?("#{path}/")
  end
end
