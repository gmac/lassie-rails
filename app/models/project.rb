class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  has_many :actors
  has_many :scenes
  has_many :inventory_lists
  has_many :inventory_items
  has_many :inventory_combos
end