# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name,
            presence: true

  validates :email,
            uniqueness: true,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password,
            length: { minimum: 6 },
            presence: true
end
