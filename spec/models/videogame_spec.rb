require 'rails_helper'

RSpec.describe Videogame, type: :model do
  let(:videogame) do
    Videogame.create(name: 'videogame name', photo: 'videogame photo', description: 'videogame description',
                     price_per_day: 1.0)
  end

  context 'validations' do
    it('should be valid') do
      expect(videogame).to be_valid
    end

    it 'should be invalid when name is not present' do
      videogame.name = nil
      expect(videogame).not_to be_valid
    end

    it 'should be invalid when photo is not present' do
      videogame.photo = nil
      expect(videogame).not_to be_valid
    end

    it 'should be invalid when description is not present' do
      videogame.description = nil
      expect(videogame).not_to be_valid
    end

    it 'should be invalid when price_per_day is not present' do
      videogame.price_per_day = nil
      expect(videogame).not_to be_valid
    end

    it 'should be invalid when price_per_day is not greater than 0' do
      videogame.price_per_day = 0
      expect(videogame).not_to be_valid
    end
  end
end
