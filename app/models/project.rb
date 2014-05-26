class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  has_many :actors, dependent: :destroy
  has_many :behavior_types, dependent: :destroy
  has_many :inventory_combos, dependent: :destroy
  has_many :inventory_items, dependent: :destroy
  has_many :inventory_lists, dependent: :destroy
  has_many :scenes, dependent: :destroy
end