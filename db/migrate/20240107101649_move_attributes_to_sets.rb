class MoveAttributesToSets < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercise_instances, :weight, :integer
    remove_column :exercise_instances, :reps, :integer
    remove_column :exercise_instances, :time, :integer
    remove_column :exercise_instances, :distance, :integer
    remove_column :exercise_instances, :sets, :integer
  end
end
