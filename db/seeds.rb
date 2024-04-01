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

EXERCISE_CATEGORIES.each do |name|
  Category.find_or_create_by!(name: name)
end

exercise_instances = [
  # Strength Training Exercises
  { set_number: 1, exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 12, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 1 },
  { set_number: 2, exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 10, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 1 },
  { set_number: 2, exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 8, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 1 },
  { set_number: 1, exercise_log_id: 1, exercise_id: 1, weight: 100, reps: 7, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 1 },

  { set_number: 1, exercise_log_id: 1, exercise_id: 2, weight: 50, reps: 10, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today - 1 },
  { set_number: 1, exercise_log_id: 1, exercise_id: 3, weight: 15, reps: 15, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today },

  # Cardio Exerc
  { set_number: 2, exercise_log_id: 1, exercise_id: 4, weight: 123, reps: 123, time: 45, distance: 5, calories: 250, is_pr: false,
    start_time: Date.today },
  { set_number: 3, exercise_log_id: 1, exercise_id: 4, weight: 123, reps: 123, time: 45, distance: 5, calories: 250, is_pr: false,
    start_time: Date.today },
  { set_number: 3, exercise_log_id: 1, exercise_id: 4, weight: 123, reps: 123, time: 45, distance: 5, calories: 250, is_pr: false,
    start_time: Date.today },

  { set_number: 3, exercise_log_id: 1, exercise_id: 5, weight: 123, reps: 123, time: 20, distance: 3, calories: 150, is_pr: false,
    start_time: Date.today + 1 },

  # Yoga/Stretches
  { set_number: 3, exercise_log_id: 1, exercise_id: 6, weight: 123, reps: 123, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today - 1 },

  # Bicep Curls (higher reps)
  { set_number: 3, exercise_log_id: 1, exercise_id: 7, weight: 25, reps: 15, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today + 2 },
  # Overhead Press (moderate weight, lower reps)
  { set_number: 1, exercise_log_id: 1, exercise_id: 8, weight: 45, reps: 8, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 2 },
  # Squats (moderate weight, higher reps)
  { set_number: 2, exercise_log_id: 1, exercise_id: 8, weight: 60, reps: 12, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today + 2 },
  # Lunges (moderate weight, moderate reps)
  { set_number: 3, exercise_log_id: 1, exercise_id: 8, weight: 30, reps: 10, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 2 },
  # Dumbbell Rows (moderate weight, moderate reps)
  { set_number: 4, exercise_log_id: 1, exercise_id: 7, weight: 35, reps: 10, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today + 2 },

  # Hamstring Curls (moderate weight, higher reps)
  { set_number: 1, exercise_log_id: 1, exercise_id: 8, weight: 30, reps: 15, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 3 },
  # Calf Raises (moderate weight, higher reps)
  { set_number: 1, exercise_log_id: 1, exercise_id: 7, weight: 40, reps: 20, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today + 3 },
  # Lateral Raises (lighter weight, moderate reps)
  { set_number: 2, exercise_log_id: 1, exercise_id: 1, weight: 15, reps: 12, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 3 },
  # Dips (bodyweight exercise)
  { set_number: 2, exercise_log_id: 1, exercise_id: 1, weight: 123, reps: 10, time: 123, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today + 3 },
  # Pull-Ups (bodyweight exercise)
  { set_number: 3, exercise_log_id: 1, exercise_id: 2, weight: 123, reps: 8, time: 123, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today + 3 },

  # Swimming (longer duration, moderate intensity)
  { set_number: 2, exercise_log_id: 1, exercise_id: 2, weight: 123, reps: 123, time: 60, distance: 1000, calories: 350, is_pr: false,
    start_time: Date.today + 1 },
  # HIIT (shorter duration, high intensity)
  { set_number: 1, exercise_log_id: 1, exercise_id: 3, weight: 123, reps: 123, time: 20, distance: 123, calories: 200, is_pr: true,
    start_time: Date.today + 2 },
  # Cycling (moderate duration, moderate intensity)
  { set_number: 1, exercise_log_id: 1, exercise_id: 4, weight: 123, reps: 123, time: 45, distance: 15, calories: 300, is_pr: false,
    start_time: Date.today + 3 },

  # Elliptical Trainer (moderate duration, moderate intensity)
  { set_number: 1, exercise_log_id: 1, exercise_id: 7, weight: 123, reps: 123, time: 30, distance: 5, calories: 200, is_pr: false,
    start_time: Date.today - 1 },
  # Running (moderate distance, moderate intensity)
  { set_number: 1, exercise_log_id: 1, exercise_id: 3, weight: 123, reps: 123, time: 30, distance: 3, calories: 250, is_pr: true,
    start_time: Date.today - 1 },
  # Jump Rope (high intensity, shorter duration)
  { set_number: 1, exercise_log_id: 1, exercise_id: 4, weight: 123, reps: 123, time: 10, distance: 123, calories: 100, is_pr: false,
    start_time: Date.today - 1 },

  # Sun Salutations (multiple sets)
  { set_number: 1, exercise_log_id: 1, exercise_id: 5, weight: 123, reps: 123, time: 10, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today - 2 },
  # Warrior Pose (hold time)
  { set_number: 2, exercise_log_id: 1, exercise_id: 6, weight: 123, reps: 123, time: 60, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today - 2 },
  # Downward-Facing Dog (hold time)
  { set_number: 3, exercise_log_id: 1, exercise_id: 7, weight: 123, reps: 123, time: 45, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today - 2 },

  # Plank (hold time)
  { set_number: 3, exercise_log_id: 1, exercise_id: 5, weight: 123, reps: 123, time: 30, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today - 1 },
  # Bridge (hold time)
  { set_number: 3, exercise_log_id: 1, exercise_id: 6, weight: 123, reps: 123, time: 45, distance: 123, calories: 123, is_pr: true,
    start_time: Date.today - 1 },
  # Child's Pose (restorative pose)
  { set_number: 3, exercise_log_id: 1, exercise_id: 7, weight: 123, reps: 123, time: 5, distance: 123, calories: 123, is_pr: false,
    start_time: Date.today - 1 }
]

User.all.each do |user|
  # Find user's first exercise log (if any)
  first_log = ExerciseLog.find_by(user_id: user.id)

  # Check if a log exists
  next unless first_log

  exercise_instances.each do |exercise_data|
    # Create exercise instance for the user and first log
    ExerciseInstance.create!(
      weight: exercise_data[:weight],
      reps: exercise_data[:reps],
      time: exercise_data[:time],
      distance: exercise_data[:distance],
      calories: exercise_data[:calories],
      is_pr: exercise_data[:is_pr],
      exercise_log_id: exercise_data[:exercise_log_id],
      set_number: exercise_data[:set_number],
      exercise_id: exercise_data[:exercise_id],
      start_time: exercise_data[:start_time]
    )
  end
end
