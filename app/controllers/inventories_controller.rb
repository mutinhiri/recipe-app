class InventoriesController < ApplicationController
    before_action :set_inventory, only: %i[show edit update destroy]
    before_action :authenticate_user!    

    def index
        @inventories = current_user.inventories
    end

    def show; end

    def new
        @inventory = Inventory.new
    end

    def create
        user = current_user.id if current_user
        @inventory = Inventory.new(user_id: user, name: inventory_params[:name])

        if @inventory.save
            flash[:succes] = 'New inventory added!'
            redirect_to inventory_url(@inventory)
        else
            flash[:error] = @inventory.errors.full_messages
            render :new
        end
    end

     def destroy
        @inventory.destroy    
        redirect_to inventories_url 
        flash[:success] = 'Inventory was successfully deleted.'
    end
  
    private

    def set_inventory
        @inventory = Inventory.find(params[:id])
    end

    def inventory_params
        params.require(:data).permit(:name)
    end  
end
