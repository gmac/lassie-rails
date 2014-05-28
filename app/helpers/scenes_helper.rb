module ScenesHelper
  
  def find_parent_scene
    @scene = Scene.find(params[:scene_id])
  end

end