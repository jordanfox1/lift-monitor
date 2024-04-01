# frozen_string_literal: true

class AddSetNumberToExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_instances, :set_number, :integer
  end
end
