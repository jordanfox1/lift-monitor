class ExerciseLog < ApplicationRecord
  belongs_to :user
  has_many :exercise_instances, dependent: :destroy

  validates :user_id, uniqueness: true
end
