class CreateSceneMatrix < ActiveRecord::Migration
  def change
    create_table :scene_matrices do |t|
      t.string :slug
    end
  end
end
