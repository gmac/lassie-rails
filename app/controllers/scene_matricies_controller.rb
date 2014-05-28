class SceneMatriciesController < ApplicationController
  include ScenesHelper
  
  protect_from_forgery with: :null_session
  before_action :find_parent_scene
  before_action :find_matrix, exclude: [:index, :create]

  def index

  end

  def create
    render json: SceneMatrix.create(matrix_params)
  end

  def show
    render json: @matrix
  end

  def update
    render json: @matrix.update(matrix_params)
  end

  def destroy
    @matrix.destroy
    render json: @matrix
  end

  private

  def find_matrix
    @matrix = SceneMatrix.find(params[:id])
  end

  def matrix_params
    params.permit(
      :scene_id,
      :slug,
      :axis,
      :color1,
      :color2,
      :scale1,
      :scale2,
      :x1,
      :x2,
      :y1,
      :y2
    )
  end
end