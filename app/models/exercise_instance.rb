# frozen_string_literal: true

class ExerciseInstance < ApplicationRecord
  enum :intensity, { warmup: 0, easy: 1, moderate: 2, hard: 3, technical_failure: 4, absolute_failure: 5 }
  belongs_to :exercise_log
  belongs_to :exercise
  has_many :set_instances, dependent: :destroy

  validates :start_time, presence: true
  validates :set_number, presence: true
end
