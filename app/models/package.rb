# frozen_string_literal: true

class Package < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :sender, class_name: 'User'
  has_many :recipients, dependent: :nullify

  accepts_nested_attributes_for :recipients

  before_create :encrypt_body

  def decrypted_body
    MessageCrypto.new(encryption_key, hash_key: true).decrypt body
  end

  private

  def encrypt_body
    self.body = MessageCrypto.new(encryption_key, hash_key: true).encrypt body
  end

  # The encryption key is generated using the following values of a package;
  # - sender id
  # - recipient emails
  #   - emails are used for now as not all recipients are expected to be registered users
  #   - TODO: extend to use recipient's email if recipient is not a registered user
  def encryption_key
    "#{sender_id}#{recipients.map(&:user).pluck(:email).join}"
  end
end
