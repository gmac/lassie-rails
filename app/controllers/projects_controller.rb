class ProjectsController < ApplicationController
  layout :select_layout
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    redirect_to @project
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to @project
  end

  def destroy
    @project.destroy
    redirect_to @project
  end

  def inventory
    @project = find_parent_project
  end

  private

  def select_layout
    %(index new).include?(action_name) ? 'root' : 'project'
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, user_ids: [])
  end
end
