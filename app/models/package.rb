# frozen_string_literal: true

class Package < ApplicationRecord
  belongs_to :sender, class_name: 'User'
end
