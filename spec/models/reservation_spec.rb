require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    user = User.create(name: 'user name', address: 'user address', email: 'user_email@mail.com',
                       password: 'user_password')
    videogame = Videogame.create(name: 'videogame name', photo: 'videogame photo', description: 'videogame description',
                                 price_per_day: 1.0)
    @reservation = Reservation.create(user:, videogame:, days: 1, total_price: 1.0)
  end

  context 'validations' do
    it('should be valid') do
      expect(@reservation).to be_valid
    end

    it 'should be invalid when user is not present' do
      @reservation.user = nil
      expect(@reservation).not_to be_valid
    end

    it 'should be invalid when videogame is not present' do
      @reservation.videogame = nil
      expect(@reservation).not_to be_valid
    end

    it 'should be invalid when days is not present' do
      @reservation.days = nil
      expect(@reservation).not_to be_valid
    end

    it 'should be invalid when days is not greater than 0' do
      @reservation.days = 0
      expect(@reservation).not_to be_valid
    end

    it 'should be invalid when total_price is not present' do
      @reservation.total_price = nil
      expect(@reservation).not_to be_valid
    end

    it 'should be invalid when total_price is not greater than 0' do
      @reservation.total_price = 0
      expect(@reservation).not_to be_valid
    end
  end
end
