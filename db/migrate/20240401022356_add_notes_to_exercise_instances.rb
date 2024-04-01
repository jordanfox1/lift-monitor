class AddNotesToExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_instances, :notes, :text
  end
end
