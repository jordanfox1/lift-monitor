class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.integer :weight
      t.integer :reps
      t.integer :sets
      t.text :notes
      t.boolean :is_custom

      t.timestamps
    end
  end
end
