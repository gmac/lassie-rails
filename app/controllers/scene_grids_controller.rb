class SceneGridsController < ApplicationController

  protect_from_forgery with: :null_session
  before_action :find_grid, except: [:index, :create]

  def index
    # render json: @scene.scene_grids
  end

  def create
    @grid = SceneGrid.new(grid_params)
    if @grid.save
      render json: @grid
    end
  end

  def show
    render json: @grid
  end

  def update
    if @grid.update(grid_params)
      render json: @grid
    end
  end

  def destroy
    if @grid.destroy
      render json: @grid
    end
  end

  private

  def find_grid
    @grid = SceneGrid.find(params[:id])
  end

  def grid_params
    params.require(:scene_grid).permit(
      :scene_id,
      :slug,
      :data
    )
  end
end