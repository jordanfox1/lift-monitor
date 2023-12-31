class CreateStandardExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :standard_exercises do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.boolean :is_custom

      t.timestamps
    end
  end
end
