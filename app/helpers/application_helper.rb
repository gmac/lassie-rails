module ApplicationHelper
  def navbar_item(name)
    active = (params[:controller] == name)
    "<li#{active ? ' class="active"' : ''}>#{yield}</li>".html_safe
  end

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