module ProjectsHelper
  
  def find_parent_project
    @project = Project.find(params[:project_id])
  end

end