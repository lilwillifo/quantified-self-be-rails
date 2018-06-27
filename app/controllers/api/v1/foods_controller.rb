class Api::V1::FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Food.all
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render status:400, json: {}
    end
  end

  def show
      render json: Food.find(params[:id])
    rescue
      render status: 404, json: {}
  end

  def update
    render json: Food.update(params[:id], food_params)
  rescue
    render status: 400, json:{}
  end

  def destroy
    render json: Food.destroy(params[:id]), status: 204
  rescue
    render status: 404, json: {}
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
