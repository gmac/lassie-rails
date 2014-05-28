module AssetsHelper
  def project_asset_category_path(project, category)
    "#{project_assets_path(project)}?category=#{category}"
  end
end