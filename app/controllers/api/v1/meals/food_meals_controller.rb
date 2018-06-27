class Api::V1::Meals::FoodMealsController < ActionController::API
  def create
    meal = Meal.find(params[:id])
    food = Food.find(params[:food_id])
    FoodMeal.create(food: food, meal: meal)
    render json: message(food, meal), status: 201
  rescue
    render status: 404, json: {}
  end

  def destroy
    meal = Meal.find(params[:id])
    food = Food.find(params[:food_id])
    join = meal.food_meals.find_by(food: params[:food_id])
    join.destroy
    render json: {"message": "Successfully removed #{food.name} from #{meal.name}"}
  rescue
    render status: 404, json: {}
  end

  private
  def message(food, meal)
    {"message": "Successfully added #{food.name} to #{meal.name}"}
  end
end
