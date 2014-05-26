class InventoryItemsController < ApplicationController
  layout 'project'
  before_action :find_parent_project
  before_action :find_inventory_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @item = InventoryItem.new
  end

  def create
    @item = @project.inventory_items.create(inventory_item_params)
    redirect_to project_inventory_items_path(@project)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_inventory_item
    @item = InventoryItem.find(params[:id])
  end

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :slug)
  end
end