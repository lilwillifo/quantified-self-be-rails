class Api::V1::MealsController < ActionController::API
  def index
    render json: Meal.all
  end
end
