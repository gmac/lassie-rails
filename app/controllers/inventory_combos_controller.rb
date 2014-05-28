class InventoryCombosController < ApplicationController
  layout 'project'

  before_action :require_signin
  before_action :find_parent_project
  before_action :find_inventory_combo, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @combo = InventoryCombo.new
  end

  def create
    @project.inventory_combos.create(inventory_combo_params)
    redirect_to project_inventory_combos_path(@project)
  end

  def show
  end

  def edit
  end

  def update
    @combo.update(inventory_combo_params)
    redirect_to project_inventory_combos_path(@project)
  end

  def destroy
  end

  private

  def find_inventory_combo
    @combo = InventoryCombo.find(params[:id])
  end

  def inventory_combo_params
    params.require(:inventory_combo).permit(:name, :slug, inventory_item_ids: [])
  end
end