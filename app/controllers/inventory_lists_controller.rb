class InventoryListsController < ApplicationController
  layout 'project'
  before_action :find_parent_project
  before_action :find_inventory_list, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @list = InventoryList.new
  end

  def create
    @project.inventory_lists.create(inventory_list_params)
    redirect_to project_inventory_lists_path(@project)
  end

  def show
  end

  def edit
  end

  def update
    @list.update(inventory_list_params)
    redirect_to project_inventory_lists_path(@project)
  end

  def destroy
  end

  private

  def find_inventory_list
    @list = InventoryList.find(params[:id])
  end

  def inventory_list_params
    params.require(:inventory_list).permit(:name, :slug, inventory_item_ids: [])
  end
end