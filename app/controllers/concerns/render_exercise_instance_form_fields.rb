# app/controllers/concerns/category_rendering.rb
module RenderExerciseInstanceFormFields
    extend ActiveSupport::Concern
  
    included do
      private
  
      def render_exercise_instance_form_fields
        if @exercise_instance.exercise.category.name == "Cardio"
          render turbo_stream: turbo_stream.update(
            "exercise_form_fields",
            partial: "exercise_instances/cardio_form_fields",
            locals: { exercise_instance: @exercise_instance }
          )
        elsif @exercise_instance.exercise.category.name == "Yoga"
          render turbo_stream: turbo_stream.update(
            "exercise_form_fields",
            partial: "exercise_instances/yoga_form_fields",
            locals: { exercise_instance: @exercise_instance }
          )
        elsif @exercise_instance.exercise.category.name == "Other"
          render turbo_stream: turbo_stream.update(
            "exercise_form_fields",
            partial: "exercise_instances/other_form_fields",
            locals: { exercise_instance: @exercise_instance }
          )
        else
          render turbo_stream: turbo_stream.update(
            "exercise_form_fields",
            partial: "exercise_instances/strength_form_fields",
            locals: { exercise_instance: @exercise_instance }
          )
        end
      end
    end
  end
  