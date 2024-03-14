class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, on: :create

  private

  def downcase_email
    self.email = email.downcase
  end
end
