class BehaviorType < ActiveRecord::Base
  belongs_to :project
  has_many :behaviors
end