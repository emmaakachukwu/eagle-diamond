# frozen_string_literal: true

class Package < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :sender, class_name: 'User'
  has_many :recipients, dependent: :nullify

  accepts_nested_attributes_for :recipients

  before_create :encrypt_body

  private

  # The encryption key is generated using the following values of a package;
  # - sender id
  # - recipient emails
  #   - emails are used for now as not all recipients are expected to be registered users
  #   - TODO: extend to use recipient's email if recipient is not a registered user
  def encrypt_body
    key = "#{sender_id}#{recipients.map(&:user).pluck(:email).join}"
    self.body = MessageCrypto.new(key, hash_key: true).encrypt body
  end
end
