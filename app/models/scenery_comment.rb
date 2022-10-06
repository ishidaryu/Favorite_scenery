class SceneryComment < ApplicationRecord
  belongs_to :user
  belongs_to :scenery
  validates :comment, presence: true
end
