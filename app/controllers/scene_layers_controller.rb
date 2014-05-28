class SceneLayersController < ApplicationController
  include ScenesHelper

  protect_from_forgery with: :null_session
  before_action :find_parent_scene
  before_action :find_layer, exclude: [:index, :create]

  def index

  end

  def create
    render json: SceneLayer.create(layer_params)
  end

  def show
    render json: @layer
  end

  def update
    render json: @layer.update(layer_params)
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

  def layer_params
    params.permit(
      :scene_id,
      :slug,
      :group,
      :order,
      :visible,
      :editor_visible,
      :interactive,
      :cursor_hover,
      :parallax_axis,
      :float_enabled,
      :float_x,
      :float_y,
      :hit_shape,
      :hit_h,
      :hit_w,
      :hit_x,
      :hit_y,
      :img_state,
      :img_h,
      :img_w,
      :img_x,
      :img_y,
      :map_orientation,
      :map_x,
      :map_y
    )
  end
end