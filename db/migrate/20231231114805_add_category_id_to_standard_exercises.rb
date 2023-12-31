class AddCategoryIdToStandardExercises < ActiveRecord::Migration[7.1]
  def change
    add_reference :standard_exercises, :category, null: false, foreign_key: true
  end
end
