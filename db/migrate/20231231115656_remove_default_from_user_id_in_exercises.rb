class RemoveDefaultFromUserIdInExercises < ActiveRecord::Migration[7.1]
  def change
    change_column_default :exercises, :user_id, from: User.first&.id, to: nil
  end
end
