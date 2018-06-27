class Api::V1::Meals::FoodsController < ActionController::API
  def index
    render json: Meal.find(params[:id]).foods
  end
end
