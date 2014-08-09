class CreateSceneMatrix < ActiveRecord::Migration
  def change
    create_table :scene_matrices do |t|
      t.references :scene
      t.string :slug
      t.string :axis
      t.string :color1
      t.string :color2
      t.integer :scale1
      t.integer :scale2
      t.integer :x1
      t.integer :x2
      t.integer :y1
      t.integer :y2
    end
  end
end
