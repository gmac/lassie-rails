class CreateSceneLayer < ActiveRecord::Migration
  def change
    create_table :scene_layers do |t|
      t.string :slug
      t.string :group
      t.integer :order
      t.boolean :visible
      t.boolean :editor_visible
      t.boolean :interactive
      t.string :cursor_hover

      t.string :parallax_axis
      t.boolean :float_enabled
      t.integer :float_x
      t.integer :float_y

      t.string :hit_shape
      t.integer :hit_h
      t.integer :hit_w
      t.integer :hit_x
      t.integer :hit_y

      t.string :img_state
      t.integer :img_h
      t.integer :img_w
      t.integer :img_x
      t.integer :img_y

      t.integer :map_orientation
      t.integer :map_x
      t.integer :map_y
    end
  end
end
