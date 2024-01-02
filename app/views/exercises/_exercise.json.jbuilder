# frozen_string_literal: true

json.extract! exercise, :id, :name, :description, :weight, :reps, :sets, :notes, :is_custom, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
