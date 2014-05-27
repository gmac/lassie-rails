class AssetsController < ApplicationController
  layout 'project'
  before_action :require_signin
  before_action :find_parent_project
  before_action :find_asset, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = @project.assets.create(asset_params)
    redirect_to project_asset_path(@project, @asset)
  end

  def show
  end

  def edit
  end

  def update
    @asset.update(asset_params)
    redirect_to project_asset_path(@project, @asset)
  end

  def destroy
    @asset.destroy
    redirect_to project_assets_path(@project)
  end

  private

  def find_asset
    @asset = Asset.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:slug, :category, :sprite_image, :sprite_sheet, :sprite_data)
  end
end
