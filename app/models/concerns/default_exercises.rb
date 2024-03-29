# frozen_string_literal: true

module DefaultExercises
  extend ActiveSupport::Concern

  def create_default_exercises

    EXERCISE_CATEGORIES.each do |name|
      Category.find_or_create_by!(name: name)
    end

    # Create  exercises associated with the user
    exercises = [
      { name: 'Squats', description: 'Description for squats...', category: legs_category, is_custom: false,
        target_muscle: 'legs' },
      { name: 'Deadlifts', description: 'Description for deadlifts...', category: legs_category, is_custom: false,
        target_muscle: 'legs' },
      { name: 'Swimming', description: 'Description for swimming...', category: cardio_category, is_custom: false,
        target_muscle: 'cardio' },
      { name: 'Jogging', description: 'Description for jogging...', category: cardio_category, is_custom: false,
        target_muscle: 'cardio' },
      { name: 'Cycling', description: 'Description for cycling...', category: cardio_category, is_custom: false,
        target_muscle: 'cardio' },
      { name: 'Jump Rope', description: 'Description for jump rope...', category: cardio_category, is_custom: false,
        target_muscle: 'cardio' },
      { name: 'High Knees', description: 'Description for high knees...', category: cardio_category, is_custom: false,
        target_muscle: 'cardio' },
      # Chest Exercises
      { name: 'Push Up',
        description: 'A bodyweight exercise that strengthens the chest, shoulders, triceps, and core. Performed in a plank position, lowering your chest towards the ground and then pushing back up.', category: 'Chest', target_muscle: 'chest, shoulders, triceps, core' },
      { name: 'Bench Press', description: 'Description for bench press...', category: Category.find_by(name: 'Chest'),
        is_custom: false, target_muscle: 'chest' },
      { name: 'Incline Barbell Bench Press',
        description: 'A variation of the bench press where the bench is angled upwards. Targets the upper chest more than the flat bench press.', category: 'Chest', target_muscle: 'upper chest, shoulders, triceps' },
      { name: 'Decline Barbell Bench Press',
        description: 'A variation of the bench press where the bench is angled downwards. Targets the lower chest more than the flat bench press.', category: 'Chest', target_muscle: 'lower chest, triceps' },
      { name: 'Dumbbell Bench Press',
        description: 'Similar to the barbell bench press but uses dumbbells, allowing for more independent movement and core engagement.', category: 'Chest', target_muscle: 'chest, shoulders, triceps' },
      { name: 'Incline Dumbbell Bench Press',
        description: 'An incline variation of the dumbbell bench press, targeting the upper chest.', category: 'Chest', target_muscle: 'upper chest, shoulders, triceps' },
      { name: 'Decline Dumbbell Bench Press',
        description: 'A decline variation of the dumbbell bench press, targeting the lower chest.', category: 'Chest', target_muscle: 'lower chest, triceps' },
      { name: 'Chest Dips',
        description: 'A bodyweight exercise performed on parallel bars. Targets the chest, triceps, and shoulders.', category: 'Chest', target_muscle: 'chest, triceps, shoulders' },
      { name: 'Dumbbell Fly',
        description: 'Isolates the chest muscles by lying on a flat bench and raising dumbbells in an arc.', category: 'Chest', target_muscle: 'chest' },
      { name: 'Incline Dumbbell Fly',
        description: 'Similar to the dumbbell fly but performed on an incline bench, targeting the upper chest.', category: 'Chest', target_muscle: 'upper chest' },
      { name: 'Decline Dumbbell Fly',
        description: 'Similar to the dumbbell fly but performed on a decline bench, targeting the lower chest.', category: 'Chest', target_muscle: 'lower chest' },
      { name: 'Cable Crossover',
        description: 'Uses cables to provide constant tension throughout the chest fly movement.', category: 'Chest', target_muscle: 'chest' },
      { name: 'Incline Push Up',
        description: 'A variation of the push-up performed with your hands elevated on a bench or other stable object. Targets the upper chest more than the standard push-up.', category: 'Chest', target_muscle: 'upper chest, shoulders, triceps, core' },
      { name: 'Decline Push Up',
        description: 'A variation of the push-up performed with your feet elevated on a bench or other stable object. Targets the lower chest more than the standard push-up.', category: 'Chest', target_muscle: 'lower chest, triceps, core' },
      # Bicep Exercises
      { name: 'Bicep Curl',
        description: 'A classic exercise to target the biceps brachii muscles. Can be performed with dumbbells or a barbell.', category: 'Arms', target_muscle: 'biceps' },
      { name: 'Barbell Curl',
        description: 'A bicep curl variation using a barbell, allowing you to lift heavier weights.', category: 'Arms', target_muscle: 'biceps' },
      { name: 'Dumbbell Hammer Curl',
        description: 'A variation of the bicep curl that targets the brachioradialis muscle on the outer forearm.', category: 'Arms', target_muscle: 'forearms (brachioradialis)' },
      { name: 'Dumbbell Concentration Curl',
        description: 'A bicep curl variation that focuses on isolating one arm at a time for better mind-muscle connection.', category: 'Arms', target_muscle: 'biceps' },
      # Tricep Exercises
      { name: 'Tricep Dip', description: 'Similar to chest dips but targets the triceps muscles primarily.',
        category: 'Arms', target_muscle: 'triceps' },
      { name: 'Barbell Lying Tricep Extension',
        description: 'Performed lying on a bench with a barbell, effectively targeting the triceps.', category: 'Arms', target_muscle: 'triceps' },
      { name: 'Cable Tricep Extension', description: 'Uses a cable machine to isolate and target the triceps muscles.',
        category: 'Arms', target_muscle: 'triceps' },
      { name: 'Dumbbell Tricep Kickback',
        description: 'An isolation exercise for the triceps performed with a dumbbell in one hand.', category: 'Arms', target_muscle: 'triceps' },
      # Cardio Exercises
      { name: 'Burpee',
        description: 'A full-body exercise combining a squat, push-up, and jump. Great for building cardio and overall fitness.', category: 'Total Body', target_muscle: 'legs, chest, shoulders, core' },
      { name: 'Treadmill', description: 'A cardio machine that simulates running or walking.', category: 'Cardio',
        target_muscle: 'legs, core' },
      { name: 'Elliptical Trainer', description: 'A low-impact cardio machine that provides a full-body workout.',
        category: 'Cardio', target_muscle: 'legs, arms, core' },
      { name: 'Stepper', description: 'A cardio machine that simulates stair climbing.', category: 'Cardio',
        target_muscle: 'legs, glutes' },
      { name: 'Jump Rope', description: 'A classic cardio exercise that improves coordination and agility.',
        category: 'Cardio', target_muscle: 'calves, shoulders' },
      { name: 'Jump Squat',
        description: 'A squat variation that adds a jump at the top, increasing power and explosiveness.', category: 'Legs', target_muscle: 'quads, glutes, calves' },
      # Olympic Lifts (Advanced)
      { name: 'Barbell Clean and Jerk',
        description: 'A complex Olympic lift that combines a clean (lifting the bar to the shoulders) and a jerk (pushing the bar overhead).', category: 'Total Body', target_muscle: 'legs, back, shoulders, core (advanced exercise)' },
      { name: 'Barbell Snatch',
        description: 'Another complex Olympic lift involving lifting the bar from the floor to overhead in one continuous motion.', category: 'Total Body', target_muscle: 'legs, back, shoulders, core (advanced exercise)' },
      # Kettlebell Exercises
      { name: 'Farmer\'s Carry',
        description: 'Carrying a weight in each hand while walking. Improves grip strength and core stability.', category: 'Total Body', target_muscle: 'core, forearms' },
      { name: 'Kettlebell Turkish Get Up',
        description: 'A full-body exercise that improves mobility, core strength, and coordination.', category: 'Total Body', target_muscle: 'legs, core, shoulders' },
      # Yoga Stretches
      { name: 'Downward-Facing Dog (Adho Mukha Svanasana)',
        description: 'A fundamental yoga pose that stretches the hamstrings, calves, spine, and shoulders.', category: 'Yoga/Stretches', target_muscle: 'hamstrings, calves, spine, shoulders' },
      { name: 'Child\'s Pose (Balasana)', description: 'A resting pose that stretches the back, hips, and thighs.',
        category: 'Yoga/Stretches', target_muscle: 'back, hips, thighs' },
      { name: 'Warrior I Pose (Virabhadrasana I)',
        description: 'A standing pose that strengthens the legs, core, and improves balance.', category: 'Yoga/Stretches', target_muscle: 'legs, core' },
      { name: 'Cobra Pose ( भुजंगासन Bhunjangasana)',
        description: 'An extension pose that opens the chest, shoulders, and strengthens the spine.', category: 'Yoga/Stretches', target_muscle: 'chest, shoulders, spine' },
      { name: 'Cat-Cow Pose (Marjaryasana-Bitilasana)',
        description: 'A dynamic movement that stretches and strengthens the spine.', category: 'Yoga/Stretches', target_muscle: 'spine' },
      { name: 'Triangle Pose (Trikonasana)',
        description: 'A standing pose that stretches the hips, hamstrings, and improves balance.', category: 'Yoga/Stretches', target_muscle: 'hips, hamstrings' },
      { name: 'Bridge Pose (Setu Bandhasana)',
        description: 'A supine pose that strengthens the glutes, hamstrings, and core.', category: 'Yoga/Stretches', target_muscle: 'glutes, hamstrings, core' }
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
