class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def create
    render json: Food.create(food_params)
  end

  def show
    render json: Food.find(params[:id])
  end

  def update
    render json: Food.update(params[:id], food_params)
  end

  def destroy
    render json: Food.destroy(params[:id]), status: 204
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
