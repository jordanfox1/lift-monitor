# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
categories = [
  'Chest',
  'Legs',
  'Arms',
  'Back',
  'Shoulders',
  'Core',
  'Total Body',
  'Cardio',
  'Yoga/Stretches',
  'Other'
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end

# cardio_exercises = [
#   ['Swimming', 'Description for swimming...'],
#   ['Jogging', 'Description for jogging...'],
#   ['Cycling', 'Description for cycling...'],
#   ['Jump Rope', 'Description for jump rope...'],
#   ['High Knees', 'Description for high knees...']
# ]

exercise_instances = [
  # Strength Training Exercises
  { exercise_log_id: 1, exercise_id: 1, weight: 30, reps: 12, time: nil, distance: nil, calories: nil, is_pr: true },  # Example for Chest exercise
  { exercise_log_id: 1, exercise_id: 2, weight: 50, reps: 10, time: nil, distance: nil, calories: nil, is_pr: true },  # Example for Back exercise
  { exercise_log_id: 1, exercise_id: 3, weight: 15, reps: 15, time: nil, distance: nil, calories: nil, is_pr: false },  # Example for Arms exercise

  # Cardio Exercises
  { exercise_log_id: 1, exercise_id: 4, weight: nil, reps: nil, time: 45, distance: 5, calories: 250, is_pr: false },  # Example for Treadmill exercise
  { exercise_log_id: 1, exercise_id: 5, weight: nil, reps: nil, time: 20, distance: 3, calories: 150, is_pr: false },  # Example for Elliptical Trainer exercise

  # Yoga/Stretches (no specific data)
  { exercise_log_id: 1, exercise_id: 6, weight: nil, reps: nil, time: nil, distance: nil, calories: nil, is_pr: false } # Example for Downward-Facing Dog pose
]

User.all.each do |user|
  # Find user's first exercise log (if any)
  first_log = ExerciseLog.find_by(user_id: user.id)

  # Check if a log exists
  if first_log
    exercise_instances.each do |exercise_data|

      # Create exercise instance for the user and first log
      exercise_instance = ExerciseInstance.create!(
        weight: exercise_data[:weight],
        reps: exercise_data[:reps],
        time: exercise_data[:time],
        distance: exercise_data[:distance],
        calories: exercise_data[:calories],
        is_pr: exercise_data[:is_pr],
        exercise_log_id: exercise_data[:exercise_log_id],
        exercise_id: exercise_data[:exercise_id],
        start_time: Time.now,
        )
    end
  end
end
