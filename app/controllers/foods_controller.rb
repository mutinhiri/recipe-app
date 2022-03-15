class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  def index; end

  private

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
