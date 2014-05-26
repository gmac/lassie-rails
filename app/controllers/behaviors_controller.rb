class BehaviorsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: parent_model.behaviors
  end

  def create
    render json: parent_model.behaviors.create(behavior_params)
  end

  def show
    render json: Behavior.find(params[:id])
  end

  def update
    behavior = Behavior.find(params[:id])
    behavior.update(behavior_params)
    render json: behavior
  end

  def destroy
    behavior = Behavior.find(params[:id])
    behavior.destroy
    render json: behavior
  end

  private

  def parent_model
    params[:type].classify.constantize.find(params[:id])
  end

  def behavior_params
    params.require(:behavior).permit(:slug, :behavior_type_id, :script)
  end
end