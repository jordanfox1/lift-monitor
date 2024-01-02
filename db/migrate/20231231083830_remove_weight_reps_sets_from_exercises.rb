# frozen_string_literal: true

class RemoveWeightRepsSetsFromExercises < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercises, :weight, :integer
    remove_column :exercises, :reps, :integer
    remove_column :exercises, :sets, :integer
  end
end
