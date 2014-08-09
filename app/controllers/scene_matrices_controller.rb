class SceneMatricesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_matrix, except: [:index, :create]

  def index
    #render json: @scene.scene_matrices
  end

  def create
    @matrix = SceneMatrix.new(matrix_params)
    if @matrix.save
      render json: @matrix
    end
  end

  def show
    render json: @matrix
  end

  def update
    if @matrix.update(matrix_params)
      render json: @matrix
    end
  end

  def destroy
    if @matrix.destroy
      render json: @matrix
    end
  end

  private

  def find_matrix
    @matrix = SceneMatrix.find(params[:id])
  end

  def matrix_params
    params.require(:scene_matrix).permit(
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