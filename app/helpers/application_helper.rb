module ApplicationHelper
  def navbar_active(controller)
    'active' if params[:controller] == controller
  end

  def navbar_active_list(domains)
    'active' if domains.include?(params[:controller]) || domains.include?(params[:action])
  end

  def behavioral_api(model)
    behaviors_path + "?type=#{model.class}&id=#{model.id}"
  end
end