class SceneGridsController < ApplicationController
  include ScenesHelper

  protect_from_forgery with: :null_session
  before_action :find_parent_scene
  before_action :find_grid, exclude: [:index, :create]

  def index

  end

  def create
    render json: SceneGrid.create(grid_params)
  end

  def show
    render json: @grid
  end

  def update
    render json: @grid.update(grid_params)
  end

  def destroy
    @grid.destroy
    render json: @grid
  end

  private

  def find_grid
    @grid = SceneGrid.find(params[:id])
  end

  def grid_params
    params.permit(
      :scene_id,
      :slug,
      :data
    )
  end
end