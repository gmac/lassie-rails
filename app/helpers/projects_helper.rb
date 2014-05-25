module ProjectsHelper
  
  def find_project
    @project = Project.find(params[:project_id])
  end

end