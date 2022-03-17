class InventoryFoodsController < ApplicationController
  before_action :set_inventory_food, only: %i[show edit update destroy]

  # GET /inventory_foods or /inventory_foods.json
  def index
    @inventory_foods = InventoryFood.all
  end

  # GET /inventory_foods/1 or /inventory_foods/1.json
  def show; end

  # GET /inventory_foods/new
  def new
    @inventory_food = InventoryFood.new
    @foods = Food.all
    @inventory_id = params[:inventory_id]
    @inventory = Inventory.find(@inventory_id)
  end

  # GET /inventory_foods/1/edit
  def edit; end

  # POST /inventory_foods or /inventory_foods.json
  def create
    @inventory_id = params[:inventory_id]
    @inventory_food = InventoryFood.new(inventory_food_params.merge(inventory_id: @inventory_id))

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to inventory_url(@inventory_id), notice: 'Inventory food was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_foods/1 or /inventory_foods/1.json
  def update; end

  # DELETE /inventory_foods/1 or /inventory_foods/1.json
  def destroy
    @inventory_food.destroy
    @inventory_id = params[:inventory_id]

    respond_to do |format|
      format.html { redirect_to inventory_path(@inventory_id), notice: 'Inventory food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_food
    @inventory_food = InventoryFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
