require 'rails_helper'

describe Meal, type: :model do
  describe 'relationships' do
    it { should have_many(:foods) }
    it { should have_many(:food_meals) }

  end
end
