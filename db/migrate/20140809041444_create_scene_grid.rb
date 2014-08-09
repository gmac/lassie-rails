class CreateSceneGrid < ActiveRecord::Migration
  def change
    create_table :scene_grids do |t|
      t.references :scene
      t.string :slug
      t.json :data
    end
  end
end
