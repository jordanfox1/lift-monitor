# frozen_string_literal: true

require 'test_helper'

class ExerciseInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_instance = exercise_instances(:one)
  end

  test 'should get index' do
    # Assuming you have a fixture or factory for ExerciseLog
    exercise_log = exercise_logs(:one)

    # Pass exercise_log_id as a parameter when generating the URL
    get exercise_log_exercise_instances_path(exercise_log_id: exercise_log.id)

    assert_response :success
  end

  # test "should get new" do
  #   get new_exercise_instance_url
  #   assert_response :success
  # end

  # test "should create exercise_instance" do
  #   assert_difference("ExerciseInstance.count") do
  #     post exercise_instances_url, params: { exercise_instance: { distance: @exercise_instance.distance, exercise_id: @exercise_instance.exercise_id, exercise_log_id: @exercise_instance.exercise_log_id, is_pr: @exercise_instance.is_pr, reps: @exercise_instance.reps, sets: @exercise_instance.sets, time: @exercise_instance.time, user_id: @exercise_instance.user_id, weight: @exercise_instance.weight } }
  #   end

  #   assert_redirected_to exercise_instance_url(ExerciseInstance.last)
  # end

  # test "should show exercise_instance" do
  #   get exercise_instance_url(@exercise_instance)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_exercise_instance_url(@exercise_instance)
  #   assert_response :success
  # end

  # test "should update exercise_instance" do
  #   patch exercise_instance_url(@exercise_instance), params: { exercise_instance: { distance: @exercise_instance.distance, exercise_id: @exercise_instance.exercise_id, exercise_log_id: @exercise_instance.exercise_log_id, is_pr: @exercise_instance.is_pr, reps: @exercise_instance.reps, sets: @exercise_instance.sets, time: @exercise_instance.time, weight: @exercise_instance.weight } }
  #   assert_redirected_to exercise_instance_url(@exercise_instance)
  # end

  # test "should destroy exercise_instance" do
  #   assert_difference("ExerciseInstance.count", -1) do
  #     delete exercise_instance_url(@exercise_instance)
  #   end

  #   assert_redirected_to exercise_instances_url
  # end
end
