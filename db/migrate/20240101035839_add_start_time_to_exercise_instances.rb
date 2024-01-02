# frozen_string_literal: true

class AddStartTimeToExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_instances, :start_time, :datetime
  end
end
