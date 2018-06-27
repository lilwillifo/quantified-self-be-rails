require 'rails_helper'

describe 'Foods API' do
  it 'sends a list of foods or empty array if none' do
    get '/api/v1/foods'

    expect(response).to be_success

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(0)

    food_list = create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_success

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(food_list.count)
  end
  it 'can create a food' do
    params = { "food": { "name": "Calzone", "calories": "800"} }
    post '/api/v1/foods', params: params

    expect(response).to be_success

    expect(Food.count).to eq(1)

    params = { "food": { "name": "Calzone lite", "calories": "5"} }
    post '/api/v1/foods', params: params

    expect(response).to be_success

    expect(Food.count).to eq(2)
  end
  it 'does not create food without name and calories' do
    params = { "food": { "name": "", "calories": ""} }
    post '/api/v1/foods', params: params

    expect(status).to eq(400)

    expect(Food.count).to eq(0)
  end
  it 'sends a single food by id' do
    get "/api/v1/foods/123"
    expect(status).to eq(404)

    foods = create_list(:food, 3)
    get "/api/v1/foods/#{foods.first.id}"

    expect(response).to be_success

    food = JSON.parse(response.body)
    expect(food["name"]).to eq(foods.first.name)
  end
  it 'can edit food' do
    food = create(:food)
    params = {}
    patch "/api/v1/foods/#{food.id}", params: params
    expect(status).to eq(400)

    params = { "food": { "name": "Mint", "calories": "14"} }
    patch "/api/v1/foods/#{food.id}", params: params

    expect(response).to be_success

    food = JSON.parse(response.body)
    expect(food["name"]).to eq(params[:food][:name])
    expect(food["calories"]).to eq(params[:food][:calories].to_i)
  end

  it 'can delete food and returns 204 status code' do
    delete "/api/v1/foods/123"
    expect(status).to eq(404)
    food = create(:food)

    expect(Food.count).to eq(1)

    delete "/api/v1/foods/#{food.id}"

    expect(response.status).to eq(204)
    expect(Food.count).to eq(0)
  end
end
