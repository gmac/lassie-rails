class CreateScene < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.references :project
      t.string :name
      t.string :slug
    end
  end
end
