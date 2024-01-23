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

  test 'should show exercise_instance' do
    get exercise_log_exercise_instance_path(@exercise_log, @exercise_instance)
    assert_response :success
  end

  test 'should get edit' do
    get edit_exercise_log_exercise_instance_path(@exercise_log, @exercise_instance)
    assert_response :success
  end

  test 'should create exercise_instance' do
    assert_difference('ExerciseInstance.count') do
      post exercise_log_exercise_instances_path(exercise_log_id: @exercise_log.id),
           params: { exercise_instance: { exercise_id: @exercise.id,
                                          exercise_log_id: @exercise_log.id,
                                          is_pr: false,
                                          start_time: Time.current } }
    end

    assert_response :found
    # I don't think this will be the final behaviour, so removing it now.
    # assert_redirected_to exercise_log_exercise_instance_url(@exercise_log, ExerciseInstance.last)
  end

  test 'should update exercise_instance' do
    patch exercise_log_exercise_instance_path(@exercise_log, @exercise_instance),
          params: { exercise_instance: { exercise_id: @exercise.id,
                                         exercise_log_id: @exercise_log.id,
                                         is_pr: true,
                                         start_time: Time.current } }

    assert_response :found

    assert_equal true, @exercise_instance.reload.is_pr
  end

  test 'should destroy exercise_instance' do
    assert_difference('ExerciseInstance.count', -1) do
      delete exercise_log_exercise_instance_path(@exercise_log, @exercise_instance)
    end
  end
end
