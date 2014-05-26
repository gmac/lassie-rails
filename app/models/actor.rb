class Actor < ActiveRecord::Base
  belongs_to :project
  has_many :behaviors, as: :behavioral, dependent: :destroy
end