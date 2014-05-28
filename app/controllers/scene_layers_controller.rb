class SceneLayersController < ApplicationController
  before_action :find_layer, exclude: [:index, :create]

  def index

  end

  def create
    render json: SceneLayer.create(scene_params)
  end

  def show
    render json: @layer
  end

  def update
    render json: @layer.update(scene_params)
  end

  def destroy
    @layer.destroy
    render json: @layer
  end

  def order

  end

  private

  def find_layer
    @layer = SceneLayer.find(params[:id])
  end

  def scene_params

  end
end