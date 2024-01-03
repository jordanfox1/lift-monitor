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

cardio_exercises = [
  ['Swimming', 'Description for swimming...'],
  ['Jogging', 'Description for jogging...'],
  ['Cycling', 'Description for cycling...'],
  ['Jump Rope', 'Description for jump rope...'],
  ['High Knees', 'Description for high knees...']
]

cardio_exercises.each do |name, description|
  Exercise.find_or_create_by!(
    name: name,
    description: description,
    category: Category.find_by(name: 'Cardio'),
    is_custom: false
  )
end
