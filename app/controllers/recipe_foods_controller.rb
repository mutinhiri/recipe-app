class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :authorize_user!
  before_action :authorize_user, only: [:destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
    @recipe_id = params[:recipe_id]
    @recipe = Recipe.find(@recipe_id)
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
    @recipe_id = params[:recipe_id]
    @recipe = Recipe.find(params[:recipe_id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_id = params[:recipe_id]
    @recipe_food = RecipeFood.new(recipe_food_params.merge(recipe_id: @recipe_id))

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe_id), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    @recipe_id = params[:recipe_id]
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_path(@recipe_id), success: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html do
          flash[:danger] = @recipe_food.errors.full_messages.join(', ')
          redirect_back(fallback_location: root_path)
        end
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy
    @recipe_id = params[:recipe_id]

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe_id), notice: 'Inventory food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def authorize_user
    redirect_to recipe_path, notice: 'You are not authorized!' unless @recipe_food.user == current_user
  end
end
