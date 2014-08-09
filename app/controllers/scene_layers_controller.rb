class SceneLayersController < ApplicationController
  
  protect_from_forgery with: :null_session
  before_action :find_layer, except: [:index, :create]

  def index
    #render json: @scene.scene_layers
  end

  def create
    @layer = SceneLayer.new(layer_params)
    if @layer.save
      render json: @layer
    end
  end

  def show
    render json: @layer
  end

  def update
    if @layer.update(layer_params)
      render json: @layer
    end
  end

  def destroy
    if @layer.destroy
      render json: @layer
    end
  end

  def order

  end

  private

  def find_layer
    @layer = SceneLayer.find(params[:id])
  end

  def layer_params
    params.require(:scene_layer).permit(
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