class RemoveUserIdFromExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    remove_reference :exercise_instances, :user, null: false, foreign_key: true
  end
end
