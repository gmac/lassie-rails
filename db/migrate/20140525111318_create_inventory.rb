class CreateInventory < ActiveRecord::Migration
  def change
    create_table :inventory_lists do |t|
      t.references :project
      t.string :name
      t.string :slug
    end

    create_table :inventory_items do |t|
      t.references :project
      t.string :name
      t.string :slug
    end

    create_table :inventory_combos do |t|
      t.references :project
      t.string :name
      t.string :slug
    end

    create_table :inventory_items_lists, id: false do |t|
      t.belongs_to :inventory_item
      t.belongs_to :inventory_list
    end

    create_table :inventory_combos_items, id: false do |t|
      t.belongs_to :inventory_combo
      t.belongs_to :inventory_item
    end
  end
end
