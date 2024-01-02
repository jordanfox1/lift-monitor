# frozen_string_literal: true

class AddCategoryIdToExercises < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercises, :category, null: false, foreign_key: true
  end
end
