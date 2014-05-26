class Behavior < ActiveRecord::Base
  belongs_to :behavior_type
  belongs_to :behavioral, polymorphic: true
end