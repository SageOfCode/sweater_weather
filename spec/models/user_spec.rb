require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :api_key}
    it {should validate_presence_of :password}
  end

  describe 'instance_methods' do 
    it '#create_key' do 
      user = User.new(
        email: 'whatever@example.com',
        password: 'password'
      )
      expect(user.create_key).to be_a(String)
    end
  end
end