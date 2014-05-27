class ActorsController < ApplicationController
  layout 'project'

  before_action :require_signin
  before_action :find_parent_project
  before_action :find_actor, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = @project.actors.create(actor_params)
    redirect_to project_actor_path(@project, @actor)
  end

  def show
  end

  def edit
  end

  def update
    @actor.update(actor_params)
    redirect_to project_actor_path(@project, @actor)
  end

  def destroy
    @actor.destroy
    redirect_to project_actors_path(@project)
  end

  private

  def find_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :slug, :actor, :subtitle_color)
  end
end
