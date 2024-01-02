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
chest_category = Category.find_or_create_by!(name: 'Chest')
legs_category = Category.find_or_create_by!(name: 'Legs')
cardio_category = Category.find_or_create_by!(name: 'Cardio')

# Create standard exercises
Exercise.find_or_create_by!(
  name: 'Bench Press',
  description: 'Description for bench press...',
  category: chest_category,
  is_custom: false
)

Exercise.find_or_create_by!(
  name: 'Squats',
  description: 'Description for squats...',
  category: legs_category,
  is_custom: false
)

Exercise.find_or_create_by!(
  name: 'Deadlifts',
  description: 'Description for deadlifts...',
  category: legs_category,
  is_custom: false
)

Exercise.find_or_create_by!(
  name: 'Swimming',
  description: 'Description for swimming...',
  category: cardio_category,
  is_custom: false
)

Exercise.find_or_create_by!(
  name: 'Jogging',
  description: 'Description for jogging...',
  category: cardio_category,
  is_custom: false
)

# Add more standard exercises
Exercise.find_or_create_by!(
  name: 'Cycling',
  description: 'Description for cycling...',
  category: cardio_category,
  is_custom: false
)

Exercise.find_or_create_by!(
  name: 'Jump Rope',
  description: 'Description for jump rope...',
  category: cardio_category,
  is_custom: false
)

Exercise.find_or_create_by!(
  name: 'High Knees',
  description: 'Description for high knees...',
  category: cardio_category,
  is_custom: false
)
