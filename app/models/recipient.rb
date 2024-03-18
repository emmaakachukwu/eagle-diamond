# frozen_string_literal: true

class Recipient < ApplicationRecord
  belongs_to :user
  belongs_to :package

  scope :unopened, -> { where opened_at: nil }
  scope :recipient, ->(user) { where user: }

  def opened?
    opened_at.present?
  end
end
