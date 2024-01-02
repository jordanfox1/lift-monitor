# frozen_string_literal: true

json.extract! exercise_instance, :id, :user_id, :exercise_log_id, :exercise_id, :weight, :reps, :time, :distance,
              :sets, :is_pr, :created_at, :updated_at
json.url exercise_instance_url(exercise_instance, format: :json)
