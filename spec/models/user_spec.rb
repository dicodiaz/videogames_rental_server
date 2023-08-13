require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(name: 'user name', address: 'user address', email: 'user_email@mail.com', password: 'user_password')
  end

  context 'validations' do
    it('should be valid') do
      expect(user).to be_valid
    end

    it 'should be invalid when name is not present' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'should be invalid when address is not present' do
      user.address = nil
      expect(user).not_to be_valid
    end

    it 'should be invalid when email is not present' do
      user.email = nil
      expect(user).not_to be_valid
    end
  end
end
