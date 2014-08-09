class Scene < ActiveRecord::Base
  belongs_to :project
  has_many :scene_grids, dependent: :destroy
  has_many :scene_layers, dependent: :destroy
  has_many :scene_matrices, dependent: :destroy
end