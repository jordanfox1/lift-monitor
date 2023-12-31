class ExerciseInstance < ApplicationRecord
  belongs_to :user
  belongs_to :exercise_log
  belongs_to :exercise
end
