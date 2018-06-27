class Api::V1::Meals::FoodMealsController < ActionController::API
  def create
    FoodMeal.create(food: food, meal: meal)
    message = "Successfully added #{food.name} to #{meal.name}"
    render json: {"message": message}, status: 201
  rescue
    render status: 404, json: {}
  end

  def destroy
    join = meal.food_meals.find_by(food: params[:food_id])
    join.destroy
    message = "Successfully removed #{food.name} from #{meal.name}"
    render json: {"message": message}
  rescue
    render status: 404, json: {}
  end

  private
  def meal
     Meal.find(params[:id])
  end

  def food
    Food.find(params[:food_id])
  end
end
