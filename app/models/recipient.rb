# frozen_string_literal: true

class Recipient < ApplicationRecord
  belongs_to :user
  belongs_to :package

  def opened?
    opened_at.present?
  end
end
