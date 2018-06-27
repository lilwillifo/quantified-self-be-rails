class Api::V1::Meals::FoodsController < ActionController::API
  def index
    foods = Meal.find(params[:id]).foods
    if foods.empty?
      render status: 404, json: {}
    else
      render json: foods
    end
  end
end
