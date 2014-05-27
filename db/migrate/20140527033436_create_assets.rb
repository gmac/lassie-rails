class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :project
      t.string :slug
      t.string :category
      t.attachment :sprite_image
      t.attachment :sprite_sheet
      t.attachment :sprite_data
    end
  end
end
