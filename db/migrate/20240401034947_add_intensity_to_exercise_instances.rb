# frozen_string_literal: true

class AddIntensityToExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_instances, :intensity, :integer
  end
end
