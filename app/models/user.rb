require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :api_key, uniqueness: true
  validates_presence_of :password

  def create_key
    self.api_key = SecureRandom.hex(27)
  end
end

