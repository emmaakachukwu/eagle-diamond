# frozen_string_literal: true

class Package < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :sender, class_name: 'User'
  has_many :recipients, dependent: :nullify
end
