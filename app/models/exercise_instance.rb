class ExerciseInstance < ApplicationRecord
  belongs_to :exercise_log
  belongs_to :exercise

  validates :start_time, presence: true
end
