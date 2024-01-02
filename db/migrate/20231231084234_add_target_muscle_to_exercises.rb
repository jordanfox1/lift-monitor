# frozen_string_literal: true

class AddTargetMuscleToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :target_muscle, :string
  end
end
