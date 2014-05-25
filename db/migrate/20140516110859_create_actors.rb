class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.references :project
      t.string :name
      t.string :slug
      t.string :actor
      t.string :subtitle_color
    end
  end
end
