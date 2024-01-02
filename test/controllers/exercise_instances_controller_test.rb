# frozen_string_literal: true

require 'test_helper'

class ExerciseInstancesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @exercise = exercises(:one)
    @exercise_log = exercise_logs(:one)
    @exercise_instance = exercise_instances(:one)
    sign_in users(:one)
  end

  teardown do
    sign_out users(:one)
  end

  test 'should get exercise instance index page' do
    get exercise_log_exercise_instances_path(exercise_log_id: @exercise_log.id)
    assert_response :success
  end

  test 'should get exercise instance new page' do
    get new_exercise_log_exercise_instance_path(exercise_log_id: @exercise_log.id)
    assert_response :success
  end

  test 'should create exercise_instance' do
    assert_difference('ExerciseInstance.count') do
      post exercise_log_exercise_instances_path(exercise_log_id: @exercise_log.id),
           params: { exercise_instance: { distance: 200,
                                          exercise_id: @exercise.id,
                                          exercise_log_id: @exercise_log.id,
                                          is_pr: false,
                                          reps: 2,
                                          sets: 2,
                                          start_time: Time.current,
                                          time: 200,
                                          weight: 30 } }
    end

    assert_response :found
    assert_redirected_to exercise_log_exercise_instance_url(@exercise_log, ExerciseInstance.last)
  end

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
