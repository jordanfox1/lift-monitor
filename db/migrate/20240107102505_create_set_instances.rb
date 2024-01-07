class CreateSetInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :set_instances do |t|
      t.integer :weight
      t.integer :reps
      t.integer :time
      t.integer :distance
      t.integer :set_number
      t.references :exercise_instance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
