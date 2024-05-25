# frozen_string_literal: true

class ExerciseLogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @exercise_log = current_user.exercise_log
    @exercise_instances = @exercise_log.exercise_instances
  end

  def exercise_instance_form
    debugger
    @exercise_log = ExerciseLog.find(params[:exercise_log_id])
    exercise_instance = ExerciseInstance.new  # Assuming you're creating a new instance
    render partial: 'form', locals: { exercise_instance: exercise_instance }
  end
end
