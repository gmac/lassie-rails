class InventoryCombo < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :inventory_items
  has_many :behaviors, as: :behavioral, dependent: :destroy
end