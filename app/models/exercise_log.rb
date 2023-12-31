class ExerciseLog < ApplicationRecord
  belongs_to :user
  has_many :exercise_instances
end
