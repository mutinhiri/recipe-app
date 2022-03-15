class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  def index; end

  def create
    @food = current_user.foods.create!(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
