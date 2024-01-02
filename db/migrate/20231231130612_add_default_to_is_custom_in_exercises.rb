# frozen_string_literal: true

class AddDefaultToIsCustomInExercises < ActiveRecord::Migration[7.1]
  def change
    change_column_default :exercises, :is_custom, true
  end
end
