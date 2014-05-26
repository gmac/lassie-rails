class InventoryItem < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :inventory_combos
  has_and_belongs_to_many :inventory_lists
  has_many :behaviors, as: :behavioral, dependent: :destroy
end