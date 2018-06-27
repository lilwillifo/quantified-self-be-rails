require 'rails_helper'

describe 'Meals API' do
  it 'sends a all meals in database along with associated foods' do
    get '/api/v1/meals'

    expect(response).to be_success

    meals = JSON.parse(response.body)
    expect(meals.count).to eq(0)

    meal_list = create_list(:meal, 3)

    get '/api/v1/meals'

    expect(response).to be_success

    meals = JSON.parse(response.body)
    binding.pry
    #add foods to meals and finish serializer
    expect(meals.count).to eq(meal_list.count)
    expect(meals.first[:foods].count).to eq(meal_list.first.foods.count)
  end
end
