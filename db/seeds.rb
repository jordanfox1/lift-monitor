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

exercise_instances = [
  # Strength Training Exercises
  { exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 12, time: nil, distance: nil, calories: nil, is_pr: true,
    start_time: Date.today + 1 },
  { exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 10, time: nil, distance: nil, calories: nil, is_pr: true,
    start_time: Date.today + 1 },
  { exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 8, time: nil, distance: nil, calories: nil, is_pr: true,
    start_time: Date.today + 1 },
  { exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 7, time: nil, distance: nil, calories: nil, is_pr: true,
    start_time: Date.today + 1 },

  { exercise_log_id: 1, exercise_id: 2, weight: 50, reps: 10, time: nil, distance: nil, calories: nil, is_pr: true,
    start_time: Date.today - 1 },
  { exercise_log_id: 1, exercise_id: 3, weight: 15, reps: 15, time: nil, distance: nil, calories: nil, is_pr: false,
    start_time: Date.today },

  # Cardio Exerc
  { exercise_log_id: 1, exercise_id: 4, weight: nil, reps: nil, time: 45, distance: 5, calories: 250, is_pr: false,
    start_time: Date.today },
  { exercise_log_id: 1, exercise_id: 4, weight: nil, reps: nil, time: 45, distance: 5, calories: 250, is_pr: false,
    start_time: Date.today },
  { exercise_log_id: 1, exercise_id: 4, weight: nil, reps: nil, time: 45, distance: 5, calories: 250, is_pr: false,
    start_time: Date.today },

  { exercise_log_id: 1, exercise_id: 5, weight: nil, reps: nil, time: 20, distance: 3, calories: 150, is_pr: false, start_time: Date.today + 1 },

  # Yoga/Stretches
  { exercise_log_id: 1, exercise_id: 6, weight: nil, reps: nil, time: nil, distance: nil, calories: nil, is_pr: false, start_time: Date.today - 1 },

  # Bicep Curls (higher reps)
  { exercise_log_id: 1, exercise_id: 7, weight: 25, reps: 15, time: nil, distance: nil, calories: nil, is_pr: false, start_time: Date.today + 2 },
  # Overhead Press (moderate weight, lower reps)
  { exercise_log_id: 1, exercise_id: 8, weight: 45, reps: 8, time: nil, distance: nil, calories: nil, is_pr: true, start_time: Date.today + 2 },
  # Squats (moderate weight, higher reps)
  { exercise_log_id: 1, exercise_id: 8, weight: 60, reps: 12, time: nil, distance: nil, calories: nil, is_pr: false, start_time: Date.today + 2 },
  # Lunges (moderate weight, moderate reps)
  { exercise_log_id: 1, exercise_id: 8, weight: 30, reps: 10, time: nil, distance: nil, calories: nil, is_pr: true, start_time: Date.today + 2 },
  # Dumbbell Rows (moderate weight, moderate reps)
  { exercise_log_id: 1, exercise_id: 7, weight: 35, reps: 10, time: nil, distance: nil, calories: nil, is_pr: false, start_time: Date.today + 2 },

  # Hamstring Curls (moderate weight, higher reps)
  { exercise_log_id: 1, exercise_id: 8, weight: 30, reps: 15, time: nil, distance: nil, calories: nil, is_pr: true, start_time: Date.today + 3 },
  # Calf Raises (moderate weight, higher reps)
  { exercise_log_id: 1, exercise_id: 7, weight: 40, reps: 20, time: nil, distance: nil, calories: nil, is_pr: false, start_time: Date.today + 3 },
  # Lateral Raises (lighter weight, moderate reps)
  { exercise_log_id: 1, exercise_id: 1, weight: 15, reps: 12, time: nil, distance: nil, calories: nil, is_pr: true, start_time: Date.today + 3 },
  # Dips (bodyweight exercise)
  { exercise_log_id: 1, exercise_id: 1, weight: nil, reps: 10, time: nil, distance: nil, calories: nil, is_pr: false, start_time: Date.today + 3 },
  # Pull-Ups (bodyweight exercise)
  { exercise_log_id: 1, exercise_id: 2, weight: nil, reps: 8, time: nil, distance: nil, calories: nil, is_pr: true, start_time: Date.today + 3 },

  # Swimming (longer duration, moderate intensity)
  { exercise_log_id: 1, exercise_id: 2, weight: nil, reps: nil, time: 60, distance: 1000, calories: 350, is_pr: false, start_time: Date.today + 1 },
  # HIIT (shorter duration, high intensity)
  { exercise_log_id: 1, exercise_id: 3, weight: nil, reps: nil, time: 20, distance: nil, calories: 200, is_pr: true, start_time: Date.today + 2 },
  # Cycling (moderate duration, moderate intensity)
  { exercise_log_id: 1, exercise_id: 4, weight: nil, reps: nil, time: 45, distance: 15, calories: 300, is_pr: false, start_time: Date.today + 3 },

  # Elliptical Trainer (moderate duration, moderate intensity)
  { exercise_log_id: 1, exercise_id: 7, weight: nil, reps: nil, time: 30, distance: 5, calories: 200, is_pr: false, start_time: Date.today - 1 },
  # Running (moderate distance, moderate intensity)
  { exercise_log_id: 1, exercise_id: 3, weight: nil, reps: nil, time: 30, distance: 3, calories: 250, is_pr: true, start_time: Date.today - 1 },
  # Jump Rope (high intensity, shorter duration)
  { exercise_log_id: 1, exercise_id: 4, weight: nil, reps: nil, time: 10, distance: nil, calories: 100, is_pr: false, start_time: Date.today - 1 },

  # Sun Salutations (multiple sets)
  { exercise_log_id: 1, exercise_id: 5, weight: nil, reps: nil, time: 10, distance: nil, calories: nil, is_pr: false, start_time: Date.today - 2 },
  # Warrior Pose (hold time)
  { exercise_log_id: 1, exercise_id: 6, weight: nil, reps: nil, time: 60, distance: nil, calories: nil, is_pr: false, start_time: Date.today - 2 },
  # Downward-Facing Dog (hold time)
  { exercise_log_id: 1, exercise_id: 7, weight: nil, reps: nil, time: 45, distance: nil, calories: nil, is_pr: true, start_time: Date.today - 2 },

  # Plank (hold time)
  { exercise_log_id: 1, exercise_id: 5, weight: nil, reps: nil, time: 30, distance: nil, calories: nil, is_pr: false, start_time: Date.today - 1 },
  # Bridge (hold time)
  { exercise_log_id: 1, exercise_id: 6, weight: nil, reps: nil, time: 45, distance: nil, calories: nil, is_pr: true, start_time: Date.today - 1 },
  # Child's Pose (restorative pose)
  { exercise_log_id: 1, exercise_id: 7, weight: nil, reps: nil, time: 5, distance: nil, calories: nil, is_pr: false, start_time: Date.today - 1 },
]

User.all.each do |user|
  # Find user's first exercise log (if any)
  first_log = ExerciseLog.find_by(user_id: user.id)

  # Check if a log exists
  next unless first_log

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
      start_time: exercise_data[:start_time]
    )
  end
end
