class SetInstancesController < ApplicationController
  before_action :set_set_instance, only: %i[show edit update destroy]

  # GET /set_instances or /set_instances.json
  def index
    @set_instances = SetInstance.all
  end

  # GET /set_instances/1 or /set_instances/1.json
  def show; end

  # GET /set_instances/new
  def new
    @set_instance = SetInstance.new
  end

  # GET /set_instances/1/edit
  def edit; end

  # POST /set_instances or /set_instances.json
  def create
    @set_instance = SetInstance.new(set_instance_params)

    respond_to do |format|
      if @set_instance.save
        format.html { redirect_to set_instance_url(@set_instance), notice: 'Set instance was successfully created.' }
        format.json { render :show, status: :created, location: @set_instance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @set_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /set_instances/1 or /set_instances/1.json
  def update
    respond_to do |format|
      if @set_instance.update(set_instance_params)
        format.html { redirect_to set_instance_url(@set_instance), notice: 'Set instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_instance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @set_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /set_instances/1 or /set_instances/1.json
  def destroy
    @set_instance.destroy!

    respond_to do |format|
      format.html { redirect_to set_instances_url, notice: 'Set instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_set_instance
    @set_instance = SetInstance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def set_instance_params
    params.fetch(:set_instance, {})
  end
end
