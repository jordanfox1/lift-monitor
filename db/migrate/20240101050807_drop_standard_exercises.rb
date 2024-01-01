class DropStandardExercises < ActiveRecord::Migration[7.1]
  def change
    drop_table :standard_exercises
  end
end
