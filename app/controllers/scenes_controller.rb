class ScenesController < ApplicationController
  layout 'project'

  before_action :require_signin
  before_action :find_parent_project
  before_action :find_scene, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = @project.scenes.create(scene_params)
    redirect_to project_scenes_path(@project)
  end

  def edit
    render layout: 'application'
  end

  def show
    render json: {
      id: @scene.id,
      layers: @scene.scene_layers,
      grids: @scene.scene_grids,
      matrices: @scene.scene_matrices
    }
  end
  
  def update
    
  end

  def destroy
    @scene.destroy
    redirect_to project_scenes_path(@project)
  end

  private

  def find_scene
    @scene = Scene.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:name, :slug)
  end
end
