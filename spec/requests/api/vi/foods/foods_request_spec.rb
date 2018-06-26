require 'rails_helper'

describe 'Foods API' do
  it 'sends a list of foods' do
    food_list = create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_success

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(food_list.count)
  end
  it 'can create a food' do
    params = { "food": { "name": "Calzone", "calories": 800} }
    post '/api/v1/foods', params: params

    expect(response).to be_success

    expect(Food.count).to eq(1)

    params = { "food": { "name": "Calzone lite", "calories": 5} }
    post '/api/v1/foods', params: params

    expect(response).to be_success

    expect(Food.count).to eq(2)
  end
end
