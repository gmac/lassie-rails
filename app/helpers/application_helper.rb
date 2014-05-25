module ApplicationHelper
  def navbar_item(name)
    active = (params[:controller] == name)
    "<li#{active ? ' class="active"' : ''}>#{yield}</li>".html_safe
  end
end