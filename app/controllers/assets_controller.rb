class AssetsController < ApplicationController
  layout 'project'
  
  before_action :require_signin
  before_action :find_parent_project
  before_action :find_asset, only: [:show, :edit, :update, :destroy]

  def index
    @assets = []
    @categories = []

    if params.has_key?(:category)
      @assets = Asset.where(category: params[:category])
    else
      @categories = Asset.uniq.pluck(:category)
    end
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
    if @asset.update(asset_params)
      redirect_to project_asset_path(@project, @asset)
    else
      render :edit
    end
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
