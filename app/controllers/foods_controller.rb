class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @food = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.create!(
      name: params[:food][:name],
      measurement_unit: params[:food][:measurement_unit],
      price: params[:food][:price]
    )

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.delete
    respond_to do |format|
      format.html { redirect_to foods_path, notice: 'Food was successfully deleted.' }
      format.json { head :no_content }
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
