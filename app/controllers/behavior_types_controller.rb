class BehaviorTypesController < ApplicationController
  layout 'project'

  before_action :require_signin
  before_action :find_parent_project
  before_action :find_behavior_type, only: [:show, :edit, :update, :destroy]

  def index
    @types = BehaviorType.all
  end

  def new
    @type = BehaviorType.new
  end

  def create
    @type = BehaviorType.create(behavior_type_params)
    redirect_to project_behavior_type_path(@project, @type)
  end

  def show
  end

  def edit
  end

  def update
    @type.update(behavior_type_params)
    redirect_to project_behavior_type_path(@project, @type)
  end

  def destroy
    num_types = @project.behavior_types.count

    if num_types > 1
      @type.destroy
      redirect_to project_behavior_types_path(@project)
    else
      flash[:error] = 'Cannot delete the only behavior type.'
      render :index
    end
  end

  private

  def find_behavior_type
    @type = BehaviorType.find(params[:id])
  end

  def behavior_type_params
    params.require(:behavior_type).permit(:slug)
  end
end