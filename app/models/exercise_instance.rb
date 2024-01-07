# frozen_string_literal: true

class ExerciseInstance < ApplicationRecord
  belongs_to :exercise_log
  belongs_to :exercise
  has_many :set_instances, dependent: :destroy

  validates :start_time, presence: true
end
