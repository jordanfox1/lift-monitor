class ExerciseInstancesController < ApplicationController
  before_action :set_exercise_instance, only: %i[ show edit update destroy ]

  # GET /exercise_instances or /exercise_instances.json
  def index
    @exercise_instances = ExerciseInstance.all
  end

  # GET /exercise_instances/1 or /exercise_instances/1.json
  def show
  end

  # GET /exercise_instances/new
  def new
    @exercise_instance = ExerciseInstance.new
  end

  # GET /exercise_instances/1/edit
  def edit
  end

  # POST /exercise_instances or /exercise_instances.json
  def create
    @exercise_instance = ExerciseInstance.new(exercise_instance_params)

    respond_to do |format|
      if @exercise_instance.save
        format.html { redirect_to exercise_instance_url(@exercise_instance), notice: "Exercise instance was successfully created." }
        format.json { render :show, status: :created, location: @exercise_instance }
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
        format.html { redirect_to exercise_instance_url(@exercise_instance), notice: "Exercise instance was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_instance }
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
      format.html { redirect_to exercise_instances_url, notice: "Exercise instance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_instance
      @exercise_instance = ExerciseInstance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_instance_params
      params.require(:exercise_instance).permit(:user_id, :exercise_log_id, :exercise_id, :weight, :reps, :time, :distance, :sets, :is_pr)
    end
end
