# frozen_string_literal: true

require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @exercise = exercises(:one)
    @category = categories(:one)
    @not_referenced_exercise = exercises(:not_referenced)
    sign_in users(:one)
  end

  teardown do 
    sign_out users(:one)
  end

  test 'should get index' do
    get exercises_url
    assert_response :success
  end

  test 'should get new' do
    get new_exercise_url
    assert_response :success
  end

  test 'should create exercise' do
    assert_difference('Exercise.count') do
      post exercises_url,
           params: { exercise: { description: 'Some description', is_custom: true, name: 'Some Name',
                                 notes: 'Lorem Ipsum', category_id: @category.id } }
    end

    assert_response :found
    #  not sure if the below behaviour should happen
    # assert_redirected_to exercise_url(Exercise.last)
  end

  test 'should show exercise' do
    get exercise_url(@exercise)
    assert_response :success
  end

  test 'should get edit' do
    get edit_exercise_url(@exercise)
    assert_response :success
  end

test 'should update exercise' do
    patch exercise_url(@exercise),
          params: { exercise: { description: 'Updated description', name: 'Updated Name'} }

    assert_redirected_to exercise_url(@exercise)
    @exercise.reload
    assert_equal 'Updated description', @exercise.description 
    assert_equal 'Updated Name', @exercise.name
  end


  test 'should destroy exercise' do
    assert_difference('Exercise.count', -1) do
      delete exercise_url(@not_referenced_exercise)
    end

    assert_redirected_to exercises_url
  end
end
