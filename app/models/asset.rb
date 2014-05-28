class Asset < ActiveRecord::Base

  Paperclip.options[:content_type_mappings] = {
    json: 'text/plain'
  }

  has_attached_file :sprite_image, default_url: ''
  has_attached_file :sprite_sheet, default_url: ''
  has_attached_file :sprite_data, default_url: ''

  # Sprite Image
  validates_attachment_content_type :sprite_image, content_type: /\Aimage.*\Z/
  validates_attachment_file_name :sprite_image, matches: [/\.png\Z/, /\.jpe?g\Z/]

  # Sprite Sheet
  validates_attachment_content_type :sprite_sheet, content_type: /\A.*json\Z/
  validates_attachment_file_name :sprite_sheet, matches: [/\.json\Z/]

  # Sprite Data
  validates_attachment_content_type :sprite_data, content_type: /\A.*json\Z/
  validates_attachment_file_name :sprite_data, matches: [/\.json\Z/]
end