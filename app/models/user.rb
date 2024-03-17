# frozen_string_literal: true

class User < ApplicationRecord
  has_many :packages, dependent: :restrict_with_exception, inverse_of: :sender

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :name, presence: true

  def avatar
    "https://ui-avatars.com/api/?name=#{name}"
  end
end
