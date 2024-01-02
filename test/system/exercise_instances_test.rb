# frozen_string_literal: true

require 'application_system_test_case'

class ExerciseInstancesTest < ApplicationSystemTestCase
  setup do
    @exercise_instance = exercise_instances(:one)
  end

  test 'visiting the index' do
    visit exercise_instances_url
    assert_selector 'h1', text: 'Exercise instances'
  end

  test 'should create exercise instance' do
    visit exercise_instances_url
    click_on 'New exercise instance'

    fill_in 'Distance', with: @exercise_instance.distance
    fill_in 'Exercise', with: @exercise_instance.exercise_id
    fill_in 'Exercise log', with: @exercise_instance.exercise_log_id
    check 'Is pr' if @exercise_instance.is_pr
    fill_in 'Reps', with: @exercise_instance.reps
    fill_in 'Sets', with: @exercise_instance.sets
    fill_in 'Time', with: @exercise_instance.time
    fill_in 'User', with: @exercise_instance.user_id
    fill_in 'Weight', with: @exercise_instance.weight
    click_on 'Create Exercise instance'

    assert_text 'Exercise instance was successfully created'
    click_on 'Back'
  end

  test 'should update Exercise instance' do
    visit exercise_instance_url(@exercise_instance)
    click_on 'Edit this exercise instance', match: :first

    fill_in 'Distance', with: @exercise_instance.distance
    fill_in 'Exercise', with: @exercise_instance.exercise_id
    fill_in 'Exercise log', with: @exercise_instance.exercise_log_id
    check 'Is pr' if @exercise_instance.is_pr
    fill_in 'Reps', with: @exercise_instance.reps
    fill_in 'Sets', with: @exercise_instance.sets
    fill_in 'Time', with: @exercise_instance.time
    fill_in 'User', with: @exercise_instance.user_id
    fill_in 'Weight', with: @exercise_instance.weight
    click_on 'Update Exercise instance'

    assert_text 'Exercise instance was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Exercise instance' do
    visit exercise_instance_url(@exercise_instance)
    click_on 'Destroy this exercise instance', match: :first

    assert_text 'Exercise instance was successfully destroyed'
  end
end
