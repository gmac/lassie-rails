class Asset < ActiveRecord::Base
  has_attached_file :sprite_image, default_url: ''
  has_attached_file :sprite_sheet, default_url: ''
  has_attached_file :sprite_data, default_url: ''

  validates_attachment_content_type :sprite_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :sprite_sheet, content_type: 'application/json'
  validates_attachment_content_type :sprite_data, content_type: 'application/json'
end