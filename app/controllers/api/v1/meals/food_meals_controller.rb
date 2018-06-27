class Api::V1::Meals::FoodMealsController < ActionController::API
  def create
    meal = Meal.find(params[:id])
    food = Food.find(params[:food_id])
    FoodMeal.create(food: food, meal: meal)
    render json: message(food, meal)
  end

  private
  def message(food, meal)
    {"message": "Successfully added #{food.name} to #{meal.name}"}
  end
end
