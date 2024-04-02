# frozen_string_literal: true

class ExerciseInstancesController < ApplicationController
  include RenderExerciseInstanceFormFields

  before_action :authenticate_user!
  before_action :set_exercise_log
  before_action :set_exercise_instance, only: %i[show edit update destroy]

  # GET /exercise_instances or /exercise_instances.json
  def index
    # @exercise_instances = @exercise_log.exercise_instances

    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @exercise_instances = @exercise_log.exercise_instances
                                       .where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  # GET /exercise_instances/1 or /exercise_instances/1.json
  def show; end

  # GET /exercise_instances/new
  def new
    @exercise_instance = ExerciseInstance.new

    @exercise_instances = @exercise_log.exercise_instances.all
    current_date = params[:start_time] ? Date.parse(params[:start_time]) : Date.today
    @filtered_exercises_for_date = @exercise_instances.where(start_time: current_date)
  end

  # GET /exercise_instances/1/edit
  def edit; end

  # POST /exercise_instances or /exercise_instances.json
  def create
    @exercise_instance = current_user.exercise_log.exercise_instances.new(exercise_instance_params)

    if params[:exercise_instance][:start_time].present? # Check the params for start time, and default to time.now
      @exercise_instance.start_time = DateTime.parse(params[:exercise_instance][:start_time])
    else
      @exercise_instance.start_time = Time.current
    end

    respond_to do |format|
      if @exercise_instance.save
        format.json { render :new, status: :created, location: @exercise_instance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_instances/1 or /exercise_instances/1.json
  def update
    respond_to do |format|
      if @exercise_instance.update(exercise_instance_params)
        format.html do
          redirect_to exercise_log_exercise_instance_path(@exercise_log, @exercise_instance),
                      notice: 'Exercise instance was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_instances/1 or /exercise_instances/1.json
  def destroy
    @exercise_instance.destroy!

    respond_to do |format|
      format.html do
        redirect_to exercise_log_exercise_instances_path, notice: 'Exercise instance was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def form
    @exercise_instance = ExerciseInstance.new

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exercise_instance
    @exercise_instance = ExerciseInstance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exercise_instance_params
    params.require(:exercise_instance).permit(:exercise_log_id, :exercise_id, :weight, :reps, :time, :distance,
                                              :is_pr, :start_time, :set_number, :notes)
  end

  def set_exercise_log
    @exercise_log = current_user.exercise_log
  end
end
