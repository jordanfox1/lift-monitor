class AddExerciseDataToExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_instances, :weight, :integer
    add_column :exercise_instances, :reps, :integer
    add_column :exercise_instances, :time, :decimal
    add_column :exercise_instances, :distance, :decimal
    add_column :exercise_instances, :calories, :integer
  end
end
