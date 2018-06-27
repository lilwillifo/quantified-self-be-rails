require 'rails_helper'

describe 'Meals API' do
  it 'sends a all meals in database along with associated foods' do
    get '/api/v1/meals'

    expect(response).to be_success

    meals = JSON.parse(response.body)
    expect(meals.count).to eq(0)

    meal_list = create_list(:meal, 3)
    meal_list.first.foods.create!(name: 'Banana', calories: '20')
    meal_list.first.foods.create!(name: 'Stand', calories: '100000')

    get '/api/v1/meals'

    expect(response).to be_success

    meals = JSON.parse(response.body)
    expect(meals.count).to eq(meal_list.count)
    expect(meals.first["foods"].count).to eq(meal_list.first.foods.count)
  end
  it 'shows the associated foods with a specific meal id' do
    meal = create(:meal)
    get "/api/v1/meals/#{meal.id}/foods"

    expect(status).to eq(404)

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(0)

    meal.foods.create!(name: 'Banana', calories: '20')
    meal.foods.create!(name: 'Stand', calories: '100000')
    create(:food)

    get "/api/v1/meals/#{meal.id}/foods"

    expect(response).to be_success

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(meal.foods.count)
  end
  it 'can add a food to a meal' do
    meal = create(:meal)
    food = create(:food)
    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expect(response).to be_success
    message = JSON.parse(response.body)
    expect(message["message"]).to eq("Successfully added #{food.name} to #{meal.name}")
    expect(meal.foods).to eq([food])    
  end
end
