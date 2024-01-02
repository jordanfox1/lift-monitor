# frozen_string_literal: true

class CreateExerciseInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_instances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exercise_log, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :weight
      t.integer :reps
      t.integer :time
      t.integer :distance
      t.integer :sets
      t.boolean :is_pr

      t.timestamps
    end
  end
end
