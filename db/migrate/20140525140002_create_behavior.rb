class CreateBehavior < ActiveRecord::Migration
  def change
    create_table :behavior_types do |t|
      t.references :project
      t.string  :slug
    end

    create_table :behaviors do |t|
      t.references :behavioral, polymorphic: true
      t.references :behavior_type
      t.string  :slug
    end
  end
end