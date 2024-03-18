# frozen_string_literal: true

class Recipient < ApplicationRecord
  belongs_to :user
  belongs_to :package

  scope :unopened, -> { where opened_at: nil }

  def opened?
    opened_at.present?
  end
end
