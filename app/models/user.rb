# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sent_packages, class_name: 'Package', dependent: :nullify, inverse_of: :sender
  has_many :recipients, dependent: :nullify
  has_many :packages, through: :recipients

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
