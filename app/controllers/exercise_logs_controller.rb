class ExerciseLogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @exercise_log = current_user.exercise_log
    @exercise_instances = @exercise_log.exercise_instances
  end
end
