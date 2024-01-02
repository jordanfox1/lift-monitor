# frozen_string_literal: true

module DefaultExercises
  extend ActiveSupport::Concern

  def create_default_exercises
    chest_category = Category.find_or_create_by!(name: 'Chest')
    legs_category = Category.find_or_create_by!(name: 'Legs')
    cardio_category = Category.find_or_create_by!(name: 'Cardio')

    # Create  exercises associated with the user
    exercises = [
      { name: 'Bench Press', description: 'Description for bench press...', category: chest_category },
      { name: 'Squats', description: 'Description for squats...', category: legs_category },
      { name: 'Deadlifts', description: 'Description for deadlifts...', category: legs_category },
      { name: 'Swimming', description: 'Description for swimming...', category: cardio_category },
      { name: 'Jogging', description: 'Description for jogging...', category: cardio_category },
      { name: 'Cycling', description: 'Description for cycling...', category: cardio_category },
      { name: 'Jump Rope', description: 'Description for jump rope...', category: cardio_category },
      { name: 'High Knees', description: 'Description for high knees...', category: cardio_category }
    ]

    exercises.each do |exercise_data|
      Exercise.find_or_create_by!(
        name: exercise_data[:name],
        description: exercise_data[:description],
        category: exercise_data[:category],
        is_custom: false,
        user: self
      )
    end
  end
end
