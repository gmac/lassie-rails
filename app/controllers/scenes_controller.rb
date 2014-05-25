class ScenesController < ApplicationController
  layout 'project'

  before_action :require_signin
  before_action :find_project
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

  def show
    render layout: 'scene'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_scene
    @scene = Scene.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:name, :slug)
  end
end
